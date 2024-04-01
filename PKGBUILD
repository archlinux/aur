# Maintainer: BryanLiang <liangrui.ch@gmail.com>

pkgname=go-musicfox-bin
_pkgname=go-musicfox
pkgver=4.3.3
pkgrel=1
pkgdesc='Command-line Netease Cloud Music written in Go. (Precompiled version)'
url='https://github.com/anhoder/go-musicfox'
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h')
conflicts=('go-musicfox' 'go-musicfox-git')
depends=('alsa-lib' 'flac1.3')

source=('LICENSE')
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")

sha256sums=('20535828272932407c2f5172aeb714ac7b374a34e5ecb1825af509f2902cde54')
sha256sums_x86_64=('0f49ca40a8c7f1965e1915eab6092e4c70af2b81e5652628fbecec37f3606844')
sha256sums_aarch64=('5a7f9b16eb5f17b9442780237e3e28c0de229abed03385f29e6cabe4dcf2359c')
sha256sums_armv7h=('3a4a79418445f098ba9b0b5287df9cec74bb438014c770942998b367c94a0225')

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
