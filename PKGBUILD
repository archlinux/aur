# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=delphes
pkgver=3.4.0
pkgrel=2
pkgdesc="A framework for fast simulation of a generic collider experiment"
url="http://cp3.irmp.ucl.ac.be/projects/delphes"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=("cmake"
         "root")
source=("https://github.com/delphes/delphes/archive/${pkgver}.tar.gz"
        "ExRootAnalysis.patch")
sha256sums=('35a11e7c027a4f0523827babce7b496ff660dfabb2e8b94fd8be1da7468ad197'
            'be6fc8df9c89d2b7a14ce8f01b9848ec13eec63aece31d51939baa90d89ba60f')

prepare() {
    patch -p 1 < ExRootAnalysis.patch
}

build() {
    cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/" delphes-${pkgver}
    make
}

package() {
    make install
}

# Local Variables:
# mode: sh
# End:
