# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=qqm-bin
_pkgname=qqm
pkgver=0.0.4
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
sha256sums_x86_64=('a76024d973e25a5360f3582998d011c97a5937cbe6a3f7934fc8b00d6f0e2508')
sha256sums_aarch64=('aafe6c67d9d9145676a55367b4bf6edeac45650e25dbd85857e51b8148cfe1bc')

package() {
    cd "${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu"

    install -Dm755 qqm "${pkgdir}/usr/bin/qqm"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
