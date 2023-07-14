pkgname="previsat-bin"
pkgver=6.0.0.15
pkgrel=2
pkgdesc="PreviSat is a satellite tracking software for observing purposes. Binary version"
arch=('x86_64')
url="https://previsat.sourceforge.net/"
makedepends=()
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/previsat/files/previsat/previsat6-0/previsat-6-0-0-15/previsat-${pkgver}-bin-amd64-Linux.deb/download"
				      "previsat.desktop")
sha256sums=('db11049695dd06e39d20e98e27d9f8de461496c481ddab2908a087f9a670569a'
            '9536e3151752f83e85b6f1cdd655f7ae17f32357654b21904b1dfca50e624fdd')


package() {
    tar -xpvf "${srcdir}"/data.tar.zst
    cp -r "${srcdir}"/usr "${pkgdir}"/usr

    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
    cp "${srcdir}/usr/share/Astropedia/PreviSat/PreviSat" "${pkgdir}/usr/bin/previsat"
    cp "${srcdir}/previsat.desktop" "${pkgdir}/usr/share/applications"
}
