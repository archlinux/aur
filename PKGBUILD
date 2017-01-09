# Maintainer: jaltek <jaltek(at)mailbox(dot)org>
# Contributor : Matthieu Froment <thieume(at)mailoo(dot)org>
# Contributor : Xunhua Guo <xunhua(dot)guo(at)gmail(dot)com>
# Contributor : Robert Orzanna <orschiro(at)gmail(dot)com>
# Contributor : Cassfalg <ch(dot)assfalg(at)gmx(dot)de>

pkgname=teamdrive
pkgver=4.3.0.1630
pkgrel=1
pkgdesc="Keeps data synchronised between various computers automatically."
#arch=('i686' 'x86_64')
arch=('x86_64')
url="http://www.teamdrive.com/"
license=('CUSTOM')
depends=('')

source=(teamdrive.desktop)
source_x86_64=("https://s3-eu-west-1.amazonaws.com/s3download.teamdrive.net/4.3.1630/TMDR/linux-x86_64/Install-TeamDrive-4.3.1.1630_TMDR.run")

sha256sums=('e99562233e989237984dddd5eaede97e4592452365dca4ca7f6316f3b3e0b64a')
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



