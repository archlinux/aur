# Maintainer: BryanLiang <liangrui.ch@gmail.com>

pkgname=go-musicfox-bin
_pkgname=go-musicfox
pkgver=4.3.2
pkgrel=1
pkgdesc='Command-line Netease Cloud Music written in Go. (Precompiled version)'
url='https://github.com/anhoder/go-musicfox'
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h')
conflicts=('go-musicfox')
depends=('alsa-lib' 'flac1.3')

source=('LICENSE')
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")

sha256sums=('20535828272932407c2f5172aeb714ac7b374a34e5ecb1825af509f2902cde54')
sha256sums_x86_64=('424d7de8e876c7cd83bfcfb9d7ae3fb3ee6a74942adb9db3fdaba1aec3e9d3df')
sha256sums_aarch64=('17f929891de7b7231b38aa52ccc148a0a93d5552c1be82b916eeb32f5294e271')
sha256sums_armv7h=('eb386c514a738ef6f1da4b68d74bdf563594fafb16ef8c6aedc70227f92478df')

declare -A _archmap=(
    ['x86_64']='amd64'
    ['aarch64']='arm64'
    ['armv7h']='arm'
)

_arch="${_archmap[$CARCH]}"

package() {
    cd "${srcdir}/"
    install -Dm 755 "${_pkgname}_${pkgver}_linux_${_arch}/musicfox" -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
