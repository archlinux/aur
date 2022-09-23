# Maintainer: Adrià Cabello <adriacabellocrespo at gmail dot com>
pkgname=foundry-nuke
pkgver=13.2v3
pkgrel=1
pkgdesc="Nuke is a node-based digital compositing and visual effects application"
arch=('any')
provides=('nuke')
url="https://www.foundry.com/products/nuke"
source=(https://www.foundry.com/products/download_product?file=Nuke$pkgver-linux-x86_64.tgz)
md5sums=('112031aa2dae0e1ba97db423aa325a7a') #autofill using updpkgsums

package() {
    mkdir -p "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/bin"

    ./Nuke$pkgver-linux-x86_64.run --accept-foundry-eula

    mv "Nuke$pkgver" "${pkgdir}/opt/nuke"

    ln -s "/opt/nuke/Nuke13.2" "${pkgdir}/usr/bin/nuke"
}
