# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=pororoca-bin
_app_name=Pororoca
pkgver=3.7.1
_subver=
pkgrel=1
pkgdesc="Pororoca is a HTTP testing tool, inspired by Postman, but with many improvements."
arch=('x86_64')
url="https://pororoca.io/"
license=('GPL3')
depends=('dotnet-runtime-bin')
provides=('pororoca')
conflicts=('pororoca')
options=(!strip)
source=("${pkgname}-${pkgver}-${pkgrel}.deb::https://github.com/alexandrehtrb/Pororoca/releases/download/${pkgver}${_subver}/${_app_name}_${pkgver}_amd64.deb")
sha256sums=('255112ce2f47fc0e921e9257d8694e4fe244e4f3bae152efec6052e092658c14')

package() {
    bsdtar -O -xf *.deb data.tar.zst | bsdtar -C "${pkgdir}" -xJf -
    tar xf "${srcdir}"/data.tar.zst
    cp -ar usr/{bin,lib,share} "${pkgdir}/usr"
}
