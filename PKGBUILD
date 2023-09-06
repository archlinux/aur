# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Rojikku <RojikkuNoKami at gmail dot com>
pkgname=remoteplaywhatever-bin
_pkgname=RemotePlayWhatever
pkgver=0.2.4
pkgrel=1
pkgdesc="Tiny application that lets you force remote play together any game you have in your steam library including non-steam ones."
arch=('x86_64')
license=('MIT')
url="https://github.com/m4dEngi/RemotePlayWhatever"
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('gcc-libs' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}-alpha/${_pkgname}-${pkgver}-Linux.deb"
    "LICENSE::https://raw.githubusercontent.com/m4dEngi/RemotePlayWhatever/${pkgver}-alpha/LICENSE")
sha256sums=('bccd5e80f2767e3adf83c5fcd31cfa415a97f097c95f9b5a9b22261e2479dccb'
            '284724acc9bb9b5a0579ca01589605ad6d8b4cd01094d7077ca6308aa5786cdd')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}