# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=dream
pkgver=2.1.1
pkgrel=1
pkgdesc="A software radio for AM and Digital Radio Mondiale (DRM)"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/drm"
license=(GPL2)
depends=(fftw opus libsndfile speexdsp hamlib libpulse qwt qt5-webkit qt5-svg qt5-base)
makedepends=(gcc)
source=("https://sourceforge.net/projects/drm/files/dream/${pkgver}/${pkgname}-${pkgver}-svn808.tar.gz")
md5sums=('4745a4f03216bc3afda077398d0e5d3b')

build() {
    cd "${srcdir}/${pkgname}"

    qmake-qt5 dream.pro
    make
}

package() {
    cd "${srcdir}/${pkgname}"

    make INSTALL_ROOT=${pkgdir} install
}
