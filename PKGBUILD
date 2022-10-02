# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
pkgname=foundry-mari
_pkgver_major=5
_pkgver_minor=0
_pkgver_build=4
pkgver=${_pkgver_major}.${_pkgver_minor}v${_pkgver_build}
pkgrel=1
pkgdesc="3D Painting Industry Standard Tool for complex assets"
arch=('x86_64')
license=('Custom: The Foundry')
provides=('mari')
url="https://www.foundry.com/products/mari"
source=(https://thefoundry.s3.amazonaws.com/products/mari/releases/$pkgver/Mari$pkgver-linux-x86-release-64.run)
md5sums=('c1a8f1416370c5ccc12668b953220a14') #autofill using updpkgsums

package() {
    mkdir -p "${pkgdir}/opt/mari"
    mkdir -p "${pkgdir}/usr/bin"

    chmod +x Mari$pkgver-linux-x86-release-64.run

    ./Mari$pkgver-linux-x86-release-64.run --prefix=${pkgdir}/opt/mari --accept-eula

    ln -s "/opt/mari/mari" "${pkgdir}/usr/bin/mari"
}
