# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Rojikku <RojikkuNoKami at gmail dot com>
pkgname=remoteplaywhatever-bin
_pkgname=RemotePlayWhatever
pkgver=0.2.5
pkgrel=3
pkgdesc="Tiny application that lets you force remote play together any game you have in your steam library including non-steam ones."
arch=('x86_64')
license=('MIT')
url="https://github.com/m4dEngi/RemotePlayWhatever"
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}-alpha/${_pkgname}-${pkgver}-Linux.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/m4dEngi/RemotePlayWhatever/${pkgver}-alpha/LICENSE"
)
sha256sums=('a165461ba758e44d564ef9057adc1b51185cff85846f08dd2456d332c08b8fa7'
            '284724acc9bb9b5a0579ca01589605ad6d8b4cd01094d7077ca6308aa5786cdd')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}