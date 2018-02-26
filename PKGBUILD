# Maintainer: Matt Spaulding <matt@mattops.io>
pkgname=ibm-plex-fonts
pkgver=1.0.1
pkgrel=1
pkgdesc="The package of IBM’s typeface, IBM Plex."
arch=('any')
url='https://github.com/IBM/plex'
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/IBM/plex/releases/download/v1.0.1/TrueType.zip")
sha256sums=('37e4d2ef45584c39e4540f1e355351e344af7aecbf50b7766a02302017af4e4d')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -Dm644 ${srcdir}/TrueType/*/*.ttf ${pkgdir}/usr/share/fonts/TTF

    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 ${srcdir}/TrueType/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}

    install -d ${pkgdir}/usr/share/doc/${pkgname}
    install -Dm644 ${srcdir}/TrueType/CHANGELOG ${pkgdir}/usr/share/doc/${pkgname}
}
