# Maintainer: FadeMind <fademind@gmail.com>

_basename=breeze
pkgname=yakuake-skin-${_basename}
pkgver=1.0
pkgrel=2
pkgdesc="A Breeze skin for Yakuake"
arch=('any')
url="http://opendesktop.org/content/show.php?content=167519"
license=('GPL')
depends=('yakuake')
source=("${_basename}.tar.xz::https://copy.com/PyyxvzP1XCLLsG8Q/breeze.tar.xz?download=1")
sha256sums=('f05e284b904b6604fa041bbde958a60671b6d8639c137d8edcaeda29a57fe001')

package() {
    cd ${srcdir}
    find ${_basename}/* -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/apps/yakuake/skins/{}" \;
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
    find ${pkgdir}/usr -type f -name '.directory' -delete
}  
