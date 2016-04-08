# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=android-studio
pkgname=${_pkgname}-launcher
pkgver=1
pkgrel=1
pkgdesc="Wrap android-sdk directory in UnionFS to be \"writeable\" for Android Studio"
arch=('any')
license=('GPL3')
depends=('android-studio' 'unionfs-fuse')
optdepends=('android-sdk: Use AUR android-sdk packages with Android Studio.')
source=("${pkgname}".sh "${pkgname}".desktop)
install="${pkgname}.install"
sha256sums=('60732f9d72d7ae430071704b6d44f57bcb3f0509c80533824c61d2a88b89cc30'
            '9df9c25e1048b80aba69047fd60b6ca32e223b2fb070b31240581a3b2f0101bc')

package() {
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
