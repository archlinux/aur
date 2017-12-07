# Maintainer: drpsycho

pkgname='snore-git'
pkgver=0.1
pkgrel=1
pkgdesc='sleep with feedback'
arch=('i686' 'x86_64')
url="https://github.com/clamiax/${pkgname%-git}"
license=('MIT')
depends=('glibc')
makedepends=('git' 'make')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" PREFIX='/usr'
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" PREFIX='/usr' MANPREFIX='/usr/share/man' install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
