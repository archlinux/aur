# Maintainer: Christoph Haag <haagch+aur@frickel.club>
# Contributor: Luca Bennati <lucak3 AT gmail DOT com>
# Contributor: Artem A. Klevtsov <unikum.pm@gmail.com>

pkgname=qtperf-git
pkgver=v0.2.1.r9.g1c19694
pkgrel=1
pkgdesc="A tool to test Qt graphics performance"
arch=('i686' 'x86_64')
url="https://github.com/shuttie/qtperf"
license=('custom')
depends=('qt5-base')
source=("git+https://github.com/ChristophHaag/qtperf.git")
md5sums=('SKIP')

pkgver() {
  cd qtperf
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/qtperf"
  qmake
  make
}

package() {
  cd "${srcdir}/qtperf"
  install -Dm755 "${srcdir}/qtperf/qtperf5" "${pkgdir}/usr/bin/qtperf5"
}
