# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=pororoca-bin
_app_name=Pororoca
pkgver=3.4.2
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
sha256sums=('16991046d44036e98e8c09e1667df7dc03239f680f7ceed8481cfbfaeefebd46')

package() {
    bsdtar -O -xf *.deb data.tar.zst | bsdtar -C "${pkgdir}" -xJf -
    tar xf "${srcdir}"/data.tar.zst
    cp -ar usr/{bin,lib,share} "${pkgdir}/usr"
}
