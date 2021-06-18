# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=wireguard-vanity-keygen-bin
_shortname=wireguard-vanity-keygen
pkgver=0.0.2
pkgrel=1
pkgdesc='WireGuard vanity key generator'
arch=('x86_64')
url='https://github.com/axllent/wireguard-vanity-keygen'
license=('custom')
depends=('glibc')
provides=('wireguard-vanity-keygen')
conflicts=('wireguard-vanity-keygen')
source=("https://raw.githubusercontent.com/axllent/wireguard-vanity-keygen/${pkgver}/LICENSE"
        "https://github.com/axllent/wireguard-vanity-keygen/releases/download/${pkgver}/${_shortname}_${pkgver}_linux_amd64.bz2")
sha256sums=('2cb653ca639b18430adce010d0e294db83c120c83fa32d13ea1abb17cca98c32'
            '3c89bc814104a54736eb178b063cdcd28fbcd6b59171eea97a51abfb191fed4a')

package() {
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/${_shortname}_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/${_shortname}"
}
