# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: erk <valdemarerk at gmail dot com>

pkgname=ttf-ibm-plex-mono-git
pkgver=1.4.1.r2.gdec2bc78
pkgrel=1
pkgdesc="IBM Plex"
arch=('any')
url='https://ibm.github.io/type/'
license=('SIL Open Font License, Version 1.1')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
provides=('ttf-ibm-plex' 'ttf-ibm-plex-git')
conflicts=('ttf-ibm-plex' 'ttf-ibm-plex-git')

source=("${pkgname}"::"git+https://github.com/IBM/plex.git")
sha256sums=(SKIP)

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 ${srcdir}/${pkgname}/IBM-Plex-Mono/fonts/complete/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
#    install -Dm644 ${srcdir}/${pkgname}/IBM-Plex-Sans-Condensed/fonts/complete/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
#    install -Dm644 ${srcdir}/${pkgname}/IBM-Plex-Sans/fonts/complete/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
#    install -Dm644 ${srcdir}/${pkgname}/IBM-Plex-Serif/fonts/complete/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
    install -Dm644 ${srcdir}/${pkgname}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
