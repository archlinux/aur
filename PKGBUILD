pkgname="previsat-bin"
pkgver=6.0.0.15
pkgrel=1
pkgdesc="PreviSat is a satellite tracking software for observing purposes. Binary version"
arch=('x86_64')
url="https://previsat.sourceforge.net/"
makedepends=()
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/previsat/files/previsat/previsat6-0/previsat-6-0-0-15/previsat-${pkgver}-bin-amd64-Linux.deb/download")
sha256sums=('c140b15e95714cfb56c567ab685b4efa70784bee3d8ba6a130fd6fd6c860d0df')


package() {
    tar -xpvf "${srcdir}"/data.tar.zst
    cp -r "${srcdir}"/usr "${pkgdir}"/usr

    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/usr/share/Astropedia/PreviSat/PreviSat" "${pkgdir}/usr/bin/previsat"
}
