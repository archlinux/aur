# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kiwiirc-server-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="KiwiIRC server"
arch=('armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://kiwiirc.com/"
_githuburl="https://github.com/kiwiirc/kiwiirc"
license=('Apache')
provides=("${pkgname%-server-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'sh')
install="${pkgname%-bin}.install"
source_armv6h=("${pkgname%-bin}-${pkgver}-armv6h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_armel.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_armhf.deb")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_arm64.deb")
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_i386.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_amd64.deb")
source=("${pkgname%-bin}.install")
sha256sums=('b9aa8bb14dcdbb9dce07716df7b22e9fe9ac5ff29600be6117b1b49f22ceba9e')
sha256sums_armv6h=('79d955457666307f1ec220eb7a7c0d3bc02ab44eb1f3965601e55b564f678af8')
sha256sums_armv7h=('ee633f72ab94d2525fc4066620d51863dcbe7976c08aeeb2bacb8f0999bd0bc9')
sha256sums_aarch64=('3a120751e23aaf40034ef8b37450fe26d101e9441a461d3b88432547ba391865')
sha256sums_i686=('860d5b01c178bc30e19487645b3afc512a815f572bad1094a5f734c2895530ec')
sha256sums_x86_64=('147170e21808cef14bdaabf9bee3e8fd117081e401618859e85488d0a67e7f09')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    find "${pkgdir}" -type d -perm 775 -exec chmod 755 {} \;
}