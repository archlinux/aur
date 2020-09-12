# Maintainer: enihcam <n a n e r i c w a n g gmail>

_pkgname=v2ray-plugin
pkgname=shadowsocks-v2ray-plugin-bin
pkgver=1.4.3
pkgrel=1
pkgdesc="Yet another SIP003 plugin for shadowsocks, based on v2ray"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/teddysun/${_pkgname}"
license=('MIT')
depends=(glibc)
provides=('shadowsocks-v2ray-plugin')
conflicts=('shadowsocks-v2ray-plugin')

sha1sums_x86_64=('b7c09c7d1d8c6dbb0c47265d40197faac0b64c2f')
sha1sums_aarch64=('e223fbf0532b7f3a726ee9d4d53d4654092f170d')
sha1sums_armv7h=('540f3d1751d23db5a2c4de87e8becfb7e7b50cab')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-v${pkgver}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64-v${pkgver}.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm-v${pkgver}.tar.gz")

case ${CARCH} in
    x86_64) _arch=amd64 ;;
    aarch64) _arch=arm64 ;;
    armv7h) _arch=arm ;;
    *) _arch=unknown ;;
esac

package() {
    install -Dm755 ${srcdir}/${_pkgname}_linux_${_arch} ${pkgdir}/usr/bin/${_pkgname}
}
