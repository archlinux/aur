# Maintainer: 0strodamus <0strodamus at cox dot net>
#
# note: data files need to be from a Windows installation updated to version 1.04
# http://help.starwars.com/articles/en_US/FAQ/Where-do-I-find-the-latest-patch-for-Jedi-Knight-II-Jedi-Outcast

pkgname=jedi-outcast-linux-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Jedi Knight II: Jedi Outcast Single Player Linux Port"
arch=('i686' 'x86_64')
url="https://github.com/xLAva/JediOutcastLinux"
license=('custom')
depends=('openal')
depends_x86_64=('lib32-openal')
options=(!strip) # don't strip symbols from binaries and libraries
install=$pkgname.install
source=("https://github.com/xLAva/JediOutcastLinux/releases/download/v1.0.0/JediOutcast_Linux_Binary_v1.0.0.zip"
        "$pkgname.desktop"
        '16x16.png'
        '32x32.png'
        '48x48.png'
        '128x128.png'
        '256x256.png')
sha256sums=('23e489b92626f9d131499d8caec8efbadb81a7ad208b5b910d6047529527de54'
            'b6c90bbe932addec79e3c16bb69a40c5a6c4c1227642b229c7a322b6b8613f53'
            '402d74c4041c5c725d905fd8ad535930013e18c591e0eac89125d7306aa0cbc9'
            '76ea6f97a95eba2030aab185cdd3a1cb249dd6c4774ba889a12b094c9eaca1ac'
            '69ec6cab308d938f44033260a43f25d6f6f3a1c8aeab6c90f447a2742649fae9'
            '9660c3973905ad77938dc9dea11518383f535f3c575bfcd15f73793a4ad9ab8f'
            'afb2c1a757720c70798e7f7218f823297a43bc61e0cb192e9443df67c2963903')

package() {
  # game files
  install -Dm755 "${srcdir}/jk2gamex86.so" "${pkgdir}/opt/$pkgname/jk2gamex86.so"
  install -Dm755 "${srcdir}/jk2sp" "${pkgdir}/opt/$pkgname/jk2sp"
  install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/opt/$pkgname/LICENSE.txt"
  install -Dm644 "${srcdir}/README.txt" "${pkgdir}/opt/$pkgname/README.txt"
  install -Dm644 "${srcdir}/README_Raven.txt" "${pkgdir}/opt/$pkgname/README_Raven.txt"
  # desktop file
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # icons
  install -Dm644 ${srcdir}/16x16.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${pkgname}.png"
  install -Dm644 ${srcdir}/32x32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -Dm644 ${srcdir}/48x48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -Dm644 ${srcdir}/128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  install -Dm644 ${srcdir}/256x256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
}
