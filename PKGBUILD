# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kiwiirc-server-bin
pkgver=1.7.0
pkgrel=3
pkgdesc="KiwiIRC server"
arch=('armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://kiwiirc.com/"
_githuburl="https://github.com/kiwiirc/kiwiirc"
license=('Apache')
provides=("${pkgname%-server-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'sh')
install="${pkgname%-bin}.install"
source_armv6h=("${pkgname%-bin}-${pkgver}-armv6h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-2_linux_armel.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-2_linux_armhf.deb")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-2_linux_arm64.deb")
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-2_linux_i386.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-2_linux_amd64.deb")
source=("${pkgname%-bin}.install")
sha256sums=('b9aa8bb14dcdbb9dce07716df7b22e9fe9ac5ff29600be6117b1b49f22ceba9e')
sha256sums_armv6h=('710597d087bd799f805da5c83794d4aa4a4f2aa1bf76823049bc65315597e8b3')
sha256sums_armv7h=('2552b5446a6eedd2183084bbae33b3d424ce3bf2958dd52198a7aa4389808f32')
sha256sums_aarch64=('c2049be360f916bedbcc7ea9e4286d2e69aefb4aad98b0b1f3667880cca48aab')
sha256sums_i686=('fb0b9bcd56dea1f04b92b109e4322b1ff516735374f87cec1a5e138b59b00894')
sha256sums_x86_64=('0cfc349bc08510823566b746f8bbd888c856519098cc2ab7ffee91d32b06d739')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    find "${pkgdir}" -type d -perm 775 -exec chmod 755 {} \;
}