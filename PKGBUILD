# Maintainer: AzazKamaz <san.crot@yandex.ru>

_pkgname=android-studio
pkgname=${_pkgname}-launcher
epoch=1
pkgver=1.0.3
pkgrel=1
pkgdesc="Wrap android-sdk directory in UnionFS to be \"writeable\" for Android Studio"
arch=('any')
license=('GPL3')
depends=('android-studio' 'unionfs-fuse')
optdepends=('android-sdk: Use AUR android-sdk packages with Android Studio.')
source=("${pkgname}".sh "${pkgname}".desktop)
install="${pkgname}.install"
sha256sums=('fa45d3dbb26a58ba8ef85942b7cfc35a0bcc6580460de4615c73a5e65fdd06f6'
            '9df9c25e1048b80aba69047fd60b6ca32e223b2fb070b31240581a3b2f0101bc')

package() {
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
