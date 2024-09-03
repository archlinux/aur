# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=pororoca-bin
_app_name=Pororoca
pkgver=3.5.0
pkgrel=1
pkgdesc="Pororoca is a HTTP testing tool, inspired by Postman, but with many improvements."
arch=('x86_64')
url="https://pororoca.io/"
license=('GPL3')
depends=('dotnet-runtime-bin')
provides=('pororoca')
conflicts=('pororoca')
options=(!strip)
source=("${pkgname}-${pkgver}.deb::https://github.com/alexandrehtrb/Pororoca/releases/download/${pkgver}/${_app_name}_${pkgver}_amd64.deb")
sha256sums=('63df3e0d442df6a7b80297da60040bc9a539d3ba7a12f63e7c648130e4412156')

package() {
    bsdtar -O -xf *.deb data.tar.zst | bsdtar -C "${pkgdir}" -xJf -
    tar xf "${srcdir}"/data.tar.zst
    cp -ar usr/{bin,lib,share} "${pkgdir}/usr"
}
