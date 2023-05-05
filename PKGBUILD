# Maintainer: taotieren <admin@taotieren.com>

pkgname=netscripts-atzlinux
pkgver=1.0.8
pkgrel=1
_commit="3b92babb25fd2076dd08421126b2c9ceb4141995"
pkgdesc="some simple network scripts no need any parameter"
arch=("any")
groups=()
depends=('git' 'curl' 'iftop' 'net-tools' 'iproute2' 'gawk')
makedepends=()
optdepends=()
conflicts=('netscripts-atzlinux-git')
url="https://www.atzlinux.com"
license=('GPL3')
options=(!strip)
install=${pkgname}.install
source=("git+https://gitee.com/atzlinux/netscripts-atzlinux.git#commit=${_commit}"
    "${pkgname}.install")
sha256sums=('SKIP'
            '6067b7e16b3c8193729e9620983c183de05d12d6f669d05cb2af591a52e5adea')

package() {
    install -Dm644 "${srcdir}/netscripts-atzlinux/debian/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -r "${srcdir}/netscripts-atzlinux/usr/bin" "${pkgdir}/usr"
    install -Dm755 "${srcdir}/netscripts-atzlinux/usr/sbin/iftopgw" "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/netscripts-atzlinux/usr/sbin/iftopbluetooth" "${pkgdir}/usr/bin"

    ln -sf "/usr/bin/localip" "${pkgdir}/usr/bin/lip"
    ln -sf "/usr/bin/localip" "${pkgdir}/usr/bin/lanip"
    ln -sf "/usr/bin//wanip" "${pkgdir}/usr/bin/wip"
    ln -sf "/usr/bin/iftopgw" "${pkgdir}/usr/bin/iftopg"
    ln -sf "/usr/bin/iftopbluetooth" "${pkgdir}/usr/bin/iftopb"
}

#
# makepkg --printsrcinfo > .SRCINFO
#
