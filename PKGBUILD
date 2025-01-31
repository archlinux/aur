# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
pkgname=foundry-nuke
_pkgver_major=15
_pkgver_minor=1
_pkgver_build=5
pkgver=${_pkgver_major}.${_pkgver_minor}v${_pkgver_build}
pkgrel=1
pkgdesc="Nuke is a node-based digital compositing and visual effects application"
arch=('x86_64')
license=('Custom: The Foundry')
provides=('nuke')
depends=('libxcrypt-compat')
url="https://www.foundry.com/products/nuke"
source=($pkgname-$pkgver.tgz::https://www.foundry.com/products/download_product?file=Nuke$pkgver-linux-x86_64.tgz)
md5sums=('88aaaba3b7840f4dc5e851b48e62be41')

package() {
    mkdir -p "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/bin"

    ./Nuke$pkgver-linux-x86_64.run --accept-foundry-eula

    mv "Nuke$pkgver" "${pkgdir}/opt/nuke"

    ln -s "/opt/nuke/Nuke${_pkgver_major}.${_pkgver_minor}" "${pkgdir}/usr/bin/nuke"
}
