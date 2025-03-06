# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=pororoca-bin
_app_name=Pororoca
pkgver=3.7.4
_subver=
pkgrel=1
pkgdesc="Pororoca is a HTTP testing tool, inspired by Postman, but with many improvements."
arch=('x86_64')
url="https://pororoca.io/"
license=('GPL3')
depends=('dotnet-runtime')
provides=('pororoca')
conflicts=('pororoca')
options=(!strip)
source=("${pkgname}-${pkgver}-${pkgrel}.deb::https://github.com/alexandrehtrb/Pororoca/releases/download/${pkgver}${_subver}/${_app_name}_${pkgver}_amd64.deb")
sha256sums=('09896a812a902dcf96b184e1f56e653dc718c31a6a05a8edc403d5ecb1b5f1ef')

package() {
    bsdtar -O -xf *.deb data.tar.zst | bsdtar -C "${pkgdir}" -xJf -
    tar xf "${srcdir}"/data.tar.zst
    cp -ar usr/{bin,lib,share} "${pkgdir}/usr"
}
