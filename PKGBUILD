# Maintainer: kamisaki

pkgname=cliwrap-git
pkgver=0.9.2.0.g8006f22
pkgrel=1
pkgdesc="The Spotify Wrapped for your terminal!"
arch=('any')
url="https://github.com/islemci/cliwrap"
license=('MIT')
depends=()
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/cliwrap"
  git describe --long --tags | sed 's/-/./g'
}

build() {
  cd "$srcdir/cliwrap"
  chmod +x cliwrap
}

package() {
  cd "$srcdir/cliwrap"
  install -Dm755 cliwrap "$pkgdir/usr/bin/cliwrap"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
