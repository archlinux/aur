# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=quince-git
pkgver=r12.ffd5db7
pkgrel=1
pkgdesc="A music player for Linux with low CPU usage"
arch=('i686' 'x86_64')
url="https://github.com/f35f22fan/Quince"
license=('LGPL3')
depends=('gst-plugins-base-libs' 'kglobalaccel')
makedepends=('cmake' 'git')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd Quince
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd Quince
  cmake .
  make
}

package() {
  install -Dm755 Quince/app/quince "$pkgdir/usr/bin/quince"
}
