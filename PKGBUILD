# Maintainer: Harryhaha <harry_haha@foxmail.com>
# Contributor: BryanLiang <liangrui.ch@gmail.com>

pkgname=go-musicfox-bin
_pkgname=go-musicfox
pkgver=4.8.0
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
sha256sums_x86_64=('ac80507162ec566aa1b7b0ce29f1db9f76b025a86833b08ab2679e4f159b8ee7')
sha256sums_aarch64=('533db7c3bfc443e101d3d9d1fd6bdf33935127e9e2e7808d68c803754cc17284')
sha256sums_armv7h=('52d0d76dcfeed5971a876acf72eafcc166392a988b8ab2a5ce9a4e9b82554db2')

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
