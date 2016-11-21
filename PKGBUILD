# Maintainer: jaltek <jaltek(at)mailbox(dot)org>
# Contributor : Matthieu Froment <thieume(at)mailoo(dot)org>
# Contributor : Xunhua Guo <xunhua(dot)guo(at)gmail(dot)com>
# Contributor : Robert Orzanna <orschiro(at)gmail(dot)com>
# Contributor : Cassfalg <ch(dot)assfalg(at)gmx(dot)de>

pkgname=teamdrive
pkgver=4.3.0.1605
pkgrel=1
pkgdesc="Keeps data synchronised between various computers automatically."
#arch=('i686' 'x86_64')
arch=('x86_64')
url="http://www.teamdrive.com/"
license=('CUSTOM')
depends=('')

source=(teamdrive.desktop)
source_x86_64=("https://s3-eu-west-1.amazonaws.com/s3download.teamdrive.net/4.3.1605/TMDR/linux-x86_64/Install-TeamDrive-4.3.0.1605_TMDR.run")

sha256sums=('f3b06b1d5f285e6a7c5db19fc441da3f82062a1c529b17137d19e5450b6b314f')
sha256sums_x86_64=('9f5b64bb32119992d6ae636b788f3a9cf990d4e623b6ee66bae4ddff967a4d49')


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



