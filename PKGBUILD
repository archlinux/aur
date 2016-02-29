# Maintainer: 0strodamus <0strodamus at cox dot net>
#
# note: data files need to be from a Windows installation updated to version 1.01
# http://help.starwars.com/articles/en_US/FAQ/Where-do-I-find-the-latest-patch-for-Jedi-Knight-Jedi-Academy?section=Star-Wars#patch

pkgname=jedi-academy-linux-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Jedi Knight III: Jedi Academy Single Player Linux Port"
arch=('i686' 'x86_64')
url="https://github.com/xLAva/JediAcademyLinux"
license=('custom')
depends=('openal')
depends_x86_64=('lib32-openal')
options=(!strip) # don't strip symbols from binaries and libraries
install=$pkgname.install
source=("https://github.com/xLAva/JediAcademyLinux/releases/download/v1.0.0/JediAcademy_Linux_Binary_v1.0.0.zip"
        "$pkgname.desktop"
        '16x16.png'
        '32x32.png'
        '48x48.png'
        '128x128.png'
        '256x256.png')
sha256sums=('88d2ea4695e48d90dbe7ee8430e796a772dd504faf5318c3d7a3cd97c5cd03f4'
            '01fb23a371dd60d563360dc38c503d0d43f1958f3e3acec5830bbe0e21a4dc0a'
            '402d74c4041c5c725d905fd8ad535930013e18c591e0eac89125d7306aa0cbc9'
            '76ea6f97a95eba2030aab185cdd3a1cb249dd6c4774ba889a12b094c9eaca1ac'
            '69ec6cab308d938f44033260a43f25d6f6f3a1c8aeab6c90f447a2742649fae9'
            '9660c3973905ad77938dc9dea11518383f535f3c575bfcd15f73793a4ad9ab8f'
            'afb2c1a757720c70798e7f7218f823297a43bc61e0cb192e9443df67c2963903')

package() {
  # game files
  install -Dm755 "${srcdir}/jagamex86.so" "${pkgdir}/opt/$pkgname/jagamex86.so"
  install -Dm755 "${srcdir}/jasp" "${pkgdir}/opt/$pkgname/jasp"
  install -Dm644 "${srcdir}/README.txt" "${pkgdir}/opt/$pkgname/README.txt"
  # desktop file
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # icons
  install -Dm644 ${srcdir}/16x16.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${pkgname}.png"
  install -Dm644 ${srcdir}/32x32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -Dm644 ${srcdir}/48x48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -Dm644 ${srcdir}/128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  install -Dm644 ${srcdir}/256x256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
}
