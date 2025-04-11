# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Rojikku <RojikkuNoKami at gmail dot com>
pkgname=remoteplaywhatever-bin
_pkgname=RemotePlayWhatever
pkgver=0.2.10
pkgrel=1
pkgdesc="Tiny application that lets you force remote play together any game you have in your steam library including non-steam ones.(Prebuilt version)"
arch=('x86_64')
license=('MIT')
url="https://github.com/m4dEngi/RemotePlayWhatever"
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'glibc>=2.34'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}-alpha/${_pkgname}-${pkgver}-Linux.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/m4dEngi/RemotePlayWhatever/${pkgver}-alpha/LICENSE"
)
sha256sums=('93ef3a40b81177bb8a141867eed92101a74dc9f73798d49dbdf57e0d4da1f59d'
            '284724acc9bb9b5a0579ca01589605ad6d8b4cd01094d7077ca6308aa5786cdd')
prepare() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}