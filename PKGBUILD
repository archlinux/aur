# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=qqm-bin
_pkgname=qqm
pkgver=0.0.1
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
sha256sums_x86_64=('8b8cad23199a7f2ba54043437de97c90f1f3b46cce2b0c0520c3d5190e8d49b4')
sha256sums_aarch64=('3df260b8d7db60b197d2d58ca627c626c46b3de8eeaff31446f9850836c882d4')

package() {
    cd "${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu"

    install -Dm755 qqm "${pkgdir}/usr/bin/qqm"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
