# Maintainer: jaltek <jaltek(at)mailbox(dot)org>
# Contributor : Matthieu Froment <thieume(at)mailoo(dot)org>
# Contributor : Xunhua Guo <xunhua(dot)guo(at)gmail(dot)com>
# Contributor : Robert Orzanna <orschiro(at)gmail(dot)com>
# Contributor : Cassfalg <ch(dot)assfalg(at)gmx(dot)de>

pkgname=teamdrive
pkgver=4.2.0.1501
pkgrel=1
pkgdesc="Keeps data synchronised between various computers automatically."
#arch=('i686' 'x86_64')
arch=('x86_64')
url="http://www.teamdrive.com/"
license=('CUSTOM')
depends=('')

source=(teamdrive.desktop)
#source_i686=("http://s3-eu-west-1.amazonaws.com/s3download.teamdrive.net/${pkgver}/TMDR/linux/Install-TeamDrive-${pkgver}_TMDR.run")
source_x86_64=("http://s3download.teamdrive.net.s3.amazonaws.com/4.2.1501/TMDR/linux-x86_64/Install-TeamDrive-4.2.0.1501_TMDR.run")

sha256sums=('f3b06b1d5f285e6a7c5db19fc441da3f82062a1c529b17137d19e5450b6b314f')
#sha256sums_i686=('4ccc5d00788cc44bd76dbc8fb40c2cd6335ab4a955ad37a75d13d499e30b85b1')
sha256sums_x86_64=('6038216e0ac7449f5c6a426e8be3c2c6e0f52e7265a764afe7820063079a5ddc')

options=(!strip)

build() {
    cd ${srcdir}
    chmod +x Install-TeamDrive-${pkgver}_TMDR.run
}

package() {
    ./Install-TeamDrive-${pkgver}_TMDR.run --mode unattended --prefix ${pkgdir}/opt/${pkgname}
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    rm -f "${pkgdir}/opt/${pkgname}/Uninstall TeamDrive.desktop"
    rm -f "${pkgdir}/opt/${pkgname}/uninstall"
}


