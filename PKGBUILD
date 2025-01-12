# Maintainer: Harryhaha <harry_haha@foxmail.com>
# Contributor: BryanLiang <liangrui.ch@gmail.com>

pkgname=go-musicfox-bin
_pkgname=go-musicfox
pkgver=4.6.0
pkgrel=1
pkgdesc='Command-line Netease Cloud Music written in Go. (Precompiled version)'
url='https://github.com/go-musicfox/go-musicfox'
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
depends=('alsa-lib' 'flac1.3')

source=('LICENSE')
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")

sha256sums=('20535828272932407c2f5172aeb714ac7b374a34e5ecb1825af509f2902cde54')
sha256sums_x86_64=('d6c3d9959fc76a16c42e147633660b6d29d03e3159bc787c0aef8acd84e098e4')
sha256sums_aarch64=('58ff6cf27ccbb0f15aeb298889eb8fbbfc2c4ddab5d6b856abd1caefc7227644')
sha256sums_armv7h=('3005e94489d87a97e29dde28267985a479ede494183c670775cc19d4846b4af6')

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
