# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=wireguard-vanity-keygen-bin
_shortname=wireguard-vanity-keygen
pkgver=0.0.7
pkgrel=2
pkgdesc='WireGuard vanity key generator'
arch=('x86_64' 'aarch64' 'i686' 'arm')
url='https://github.com/axllent/wireguard-vanity-keygen'
license=('MIT')
depends=('glibc')
provides=('wireguard-vanity-keygen')
conflicts=('wireguard-vanity-keygen')
source_x86_64=("https://github.com/axllent/wireguard-vanity-keygen/releases/download/${pkgver}/${_shortname}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/axllent/wireguard-vanity-keygen/releases/download/${pkgver}/${_shortname}-linux-arm64.tar.gz")
source_i686=("https://github.com/axllent/wireguard-vanity-keygen/releases/download/${pkgver}/${_shortname}-linux-386.tar.gz")
source_arm=("https://github.com/axllent/wireguard-vanity-keygen/releases/download/${pkgver}/${_shortname}-linux-arm.tar.gz")
sha256sums_x86_64=('e8b284cab55e0725cfa22b1bb869acc2355a7f576c3a27205c52d4c8d3b221a3')
sha256sums_aarch64=('df71b70502065257b0fe3b527e3f14d9a60682d55c189a539ea211706cc4c68a')
sha256sums_i686=('7e1d935b1633106a3ea5c6f70ae13eaaccea2e351f697160e484852954b6c219')
sha256sums_arm=('09017d5ee9c73f60ec2cf07bf3c395778d80042ff094c2ae68f34de998d822c1')

package() {
    # Upstream uses different format for architechture notation
    case $CARCH in
        'x86_64')   subarch='amd64' ;;
        'aarch64')  subarch='arm64' ;;
        'i686')     subarch='386'   ;;
        *)          subarch=$CARCH  ;;
    esac

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
}
