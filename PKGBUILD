# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=torrentzip.net
pkgver=3.0.0
pkgrel=1
pkgdesc='A replacement for trrntzip - tool for creating idientical zip files over multiple systems'
arch=('x86_64')
url='https://www.romvault.com/trrntzip/'
license=('LicenseRef-Unknown')
depends=('gcc-libs')
source=("https://www.romvault.com/trrntzip/download/TrrntZip.NET${pkgver//./}Linux.zip")
noextract=("TrrntZip.NET${pkgver//./}Linux.zip")
sha256sums=('51738b5893f41a2af8a0584a7b7296c677b43e15b7ebeeebe78616efc141dd0d')

prepare() {
    mkdir -p "torrentzip.net-${pkgver}"
    bsdtar -x -f "TrrntZip.NET${pkgver//./}Linux.zip" -C "torrentzip.net-${pkgver}"
}

package() {
    install -D -m755 "torrentzip.net-${pkgver}/TrrntZipCMD" -t "${pkgdir}/usr/bin"
    ln -s TrrntZipCMD "${pkgdir}/usr/bin/trrntzip.net"
    ln -s TrrntZipCMD "${pkgdir}/usr/bin/TrrntZip.NET"
}
