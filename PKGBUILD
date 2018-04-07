# Maintainer: CrocoDuck <crocoduck dot oducks at gmail dot com>

pkgname=noise-repellent-git
pkgver=r553.6c01b9c
pkgrel=1
pkgdesc="An lv2 plugin for broadband noise reduction."
arch=('i686' 'x86_64')
url="https://github.com/lucianodato/noise-repellent"
license=('LGPL3')
depends=('fftw')
makedepends=('git' 'lv2')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git://github.com/lucianodato/noise-repellent")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname%-*}"
    make
}

package() {
    cd "${pkgname%-*}"
    make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
