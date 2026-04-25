# Maintainer: Mike Pento <mjpento@gmail.com>

_pkgname=eterm-bg
pkgname=eterm-backgrounds
pkgver=0.9.6
pkgrel=1
pkgdesc="Collection of tiled and scaled backgrounds for the Eterm terminal."
arch=(any)
url="https://github.com/mikepento/${pkgname}"
license=('GPL-1.0-or-later')
options+=('!debug')
source=(https://github.com/mikepento/eterm-bg/releases/download/v${pkgver}-${pkgrel}/eterm-bg-${pkgver}-${pkgrel}.tar.gz)
sha256sums=('8f7e8f936de9e194f77f8f66725e8d7cb0b4d6b6f00998e6099479c76b36a781')

package() {
    cd "${_pkgname}-${pkgver}"

    mkdir -p ${pkgdir}/usr/share/Eterm/pix/scale
    mkdir -p ${pkgdir}/usr/share/Eterm/pix/tile

    install -Dm644 ./scale/*.jpg ${pkgdir}/usr/share/Eterm/pix/scale/
    install -Dm644 ./tile/{*.jpg,*.png} ${pkgdir}/usr/share/Eterm/pix/tile/

    # remove files already present in Eterm
    rm ${pkgdir}/usr/share/Eterm/pix/scale/Neopolis-horizon.jpg
    rm ${pkgdir}/usr/share/Eterm/pix/tile/circuit.jpg

    cp -a README.backgrounds ${pkgdir}/usr/share/Eterm/pix/
}

