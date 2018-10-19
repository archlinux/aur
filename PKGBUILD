# Maintainer: Charles Paulet <charles.paulet@epitech.eu>
# Contributor: Charles Paulet <charles.paulet@epitech.eu>
pkgname=lean-display-manager
pkgver=1.0
pkgrel=1
pkgdesc="Lean Display Manager"
arch=('x86_64' 'i686')
url="https://github.com/valkheim/ldm"
license=('GPL3.0')
depends=('xcb-util' 'pam')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver::git+https://github.com/valkheim/ldm")
md5sums=('SKIP')
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  make || return 1
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install || return 1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
