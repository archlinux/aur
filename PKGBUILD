# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=pororoca-bin
_app_name=Pororoca
pkgver=3.4.0
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
sha256sums=('e3d97add2b95f03cee24a9c26271d102486ef6ef324be51d2d4fead1360e6cbf')

package() {
    bsdtar -O -xf *.deb data.tar.zst | bsdtar -C "${pkgdir}" -xJf -
    tar xf "${srcdir}"/data.tar.zst
    cp -ar usr/{bin,lib,share} "${pkgdir}/usr"
}
