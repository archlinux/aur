# Maintainer: jaltek <jaltek(at)mailbox(dot)org>
# Contributor : Matthieu Froment <thieume(at)mailoo(dot)org>
# Contributor : Xunhua Guo <xunhua(dot)guo(at)gmail(dot)com>
# Contributor : Robert Orzanna <orschiro(at)gmail(dot)com>
# Contributor : Cassfalg <ch(dot)assfalg(at)gmx(dot)de>

pkgname=teamdrive
pkgver=3.3.2.1244
pkgrel=1
pkgdesc="Keeps data synchronised between various computers automatically."
arch=('i686' 'x86_64')
url="http://www.teamdrive.com/"
license=('CUSTOM')
depends=('')

source=(teamdrive.desktop)
source_i686=("http://s3-eu-west-1.amazonaws.com/s3download.teamdrive.net/3.3.1244/TMDR/linux/Install-TeamDrive-3.3.2.1244_TMDR.run")
source_x86_64=("http://s3-eu-west-1.amazonaws.com/s3download.teamdrive.net/3.3.1244/TMDR/linux-x86_64/Install-TeamDrive-3.3.2.1244_TMDR.run")

sha256sums=('5a414513469e161fc0675e463dd2839e22551bb7ef6f275bc0c0bc3e5c4021f1')
sha256sums_i686=('4ccc5d00788cc44bd76dbc8fb40c2cd6335ab4a955ad37a75d13d499e30b85b1')
sha256sums_x86_64=('79c0b5070425ded4ffa3a2139d6d3aef3999a1d758dc8ff4aaccb5a816d0e095')

options=(!strip)

build() {
    cd ${srcdir}
    chmod +x Install-TeamDrive-${pkgver}_TMDR.run
}

package() {
    ./Install-TeamDrive-${pkgver}_TMDR.run --mode unattended --prefix ${pkgdir}/opt/${pkgname}
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    rm "${pkgdir}/opt/${pkgname}/Uninstall TeamDrive 3.desktop"
    rm "${pkgdir}/opt/${pkgname}/uninstall"
}

