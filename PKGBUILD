# Maintainer: jaltek <jaltek(at)mailbox(dot)org>
# Contributor : Matthieu Froment <thieume(at)mailoo(dot)org>
# Contributor : Xunhua Guo <xunhua(dot)guo(at)gmail(dot)com>
# Contributor : Robert Orzanna <orschiro(at)gmail(dot)com>
# Contributor : Cassfalg <ch(dot)assfalg(at)gmx(dot)de>

pkgname=teamdrive
pkgver=4.3.1.1654
pkgrel=1
pkgdesc="Keeps data synchronised between various computers automatically."
#arch=('i686' 'x86_64')
arch=('x86_64')
url="http://www.teamdrive.com/"
license=('CUSTOM')
depends=('')

source=(teamdrive.desktop)
source_x86_64=("https://s3-eu-west-1.amazonaws.com/s3download.teamdrive.net/4.3.1654/TMDR/linux-x86_64/Install-TeamDrive-4.3.1.1654_TMDR.run")

sha256sums=('f3b06b1d5f285e6a7c5db19fc441da3f82062a1c529b17137d19e5450b6b314f')
sha256sums_x86_64=('b6c57ca991768c7983ac444c6f1bdf4b904c6df7bd47f95420d5f340dc50163b')


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

