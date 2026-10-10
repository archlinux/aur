# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=qqm-bin
_pkgname=qqm
pkgver=0.0.2
pkgrel=1
pkgdesc="go-musicfox style QQ Music terminal player with background daemon and MPRIS support (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/jinzhongjia/QQMusicApi-rs"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'alsa-lib')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('54181afea290790fa1d5f9f8e55c38990fbf181ee8088acde036a7504547aa26')
sha256sums_aarch64=('d92773fd526d4f8555321416731a451b3d5535a3c869940fd74bb42b9a24eaaa')

package() {
    cd "${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu"

    install -Dm755 qqm "${pkgdir}/usr/bin/qqm"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
