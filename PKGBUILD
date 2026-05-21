# Maintainer: Integral <integral@member.fsf.org>

pkgname=maxhub-exceedshare-bin
_pkgname=exceedshare
pkgver=5.10.45.0
pkgrel=1
pkgdesc="MAXHUB 传屏助手 - Wireless screen sharing software (binary release)"
arch=('x86_64')
url="https://www.maxhub.com"
license=('custom: commercial')
depends=(
    'glibc'
    'gcc-libs'
    'libx11'
    'libxcb'
    'libxau'
    'libxdmcp'
    'libgl'
    'libpulse'
    'zlib'
    'libice'
    'libsm'
    'libgpg-error'
    'util-linux-libs'
)
optdepends=(
    'qt5-base: for ScreenShare Qt5Concurrent support'
    'kmod: for kernel module loading (snd-dummy, uinput)'
    'systemd: for udev rules and systemd user service'
)
provides=('exceedshare')
conflicts=('exceedshare')
options=('!strip')
source=("https://github.com/panmingjun/maxhub-exceedshare/releases/download/${pkgver}/com.cvte.exceedshare_${pkgver}_amd64.deb")
sha256sums=('85ef50fbc2056b13431fcd4cd8e76d136a2918fc8b8695a5d40a2254ba5afe44')

package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}/"

    chmod -R 755 "${pkgdir}/opt/"
    chmod -R 755 "${pkgdir}/usr/"

    install -d "${pkgdir}/usr/bin/"
    ln -s "/opt/apps/com.cvte.exceedshare/files/bin/run.sh" "${pkgdir}/usr/bin/maxhub-exceedshare"
}
