pkgname="previsat-bin"
pkgver=6.0.1.2
pkgrel=1
pkgdesc="PreviSat is a satellite tracking software for observing purposes. Binary version"
arch=('x86_64')
url="https://previsat.sourceforge.net/"
depends=('qt6-multimedia')
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/previsat/files/previsat/previsat6-0/previsat-${pkgver//./-}/previsat-${pkgver}-bin-amd64-Linux.deb/download"
				      "previsat.desktop")
sha256sums=('fa7aa48102af6c1b609ea2d4492341d9fa13c8bef7e9b31aad59545269384166'
            '9536e3151752f83e85b6f1cdd655f7ae17f32357654b21904b1dfca50e624fdd')


package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"

    tar -xpvf "${srcdir}"/data.tar.zst
    cp -r "${srcdir}"/usr "${pkgdir}"

    ln -s "${srcdir}/usr/share/Astropedia/PreviSat/PreviSat" "${pkgdir}/usr/bin/previsat"
    cp "${srcdir}/previsat.desktop" "${pkgdir}/usr/share/applications/previsat.desktop"
    chmod -R 755 "${pkgdir}/usr/share/Astropedia/"
}
