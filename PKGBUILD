# Maintainer: Your Name <youremail@example.com>
pkgname=scan-s2-git
pkgver=r58.725d42d
pkgrel=1
pkgdesc="A channels scanning tool for the Linux DVB S2 API"
arch=('any')
url="https://github.com/crazycat69/scan-s2"
license=('GPL')
depends=('python')
makedepends=('git')
provides=('scan-s2')
conflicts=('scan-s2')
sha256sums=('SKIP')

source=("$pkgname"::"git+https://github.com/crazycat69/scan-s2.git")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  make
  install -Dm755 scan-s2 "$pkgdir/usr/bin/scan-s2"
}

# vim:set ts=2 sw=2 et:

