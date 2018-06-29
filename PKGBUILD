# Maintainer: Michael J. Pento <mjpento@verizon.net>

pkgname=onioncircuits
pkgver=0.5
pkgrel=1
pkgdesc="GTK application to display Tor circuits and streams"
arch=('any')
url="https://git-tails.immerda.ch/onioncircuits"
license=('GPL3')
depends=('python>=3.4.2' 'python-gobject>=3.14.0' 'stem>=1.2.2' 'gobject-introspection' 'python-distutils-extra')
source=("http://cdn-fastly.deb.debian.org/debian/pool/main/o/onioncircuits/${pkgname}_${pkgver}.orig.tar.xz")
sha256sums=('3ee331140fa6661bfd9191a0733a587e61a041bd196aec8d2a30c46fc2b08ea0')

build() {
    cd ${pkgname}-${pkgver}

    ./setup.py build
}
package() {
    cd ${pkgname}-${pkgver}

    ./setup.py install --root="${pkgdir}/"
}
