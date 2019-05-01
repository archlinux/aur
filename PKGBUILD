# Maintainer: Sam Whited <sam@samwhited.com>

_fnt_name=air-americana
pkgname=ttf-${_fnt_name}
pkgver=1.0.0
pkgrel=1
pkgdesc="A font by Tiago Sá inspired by the Air America logo."
arch=('any')
url='http://airamericana.i-am-tiago.com/'
license=('custom:OFL')
makedepends=(unrar)
source=("${pkgname}.rar::http://airamericana.i-am-tiago.com/Air_Americana.rar")
noextract=("${source[@]%%::*}")
sha256sums=('f76ddf6efb50ae7921cd63a3f632df3cb6e1a4b08c440f910764ad260641a28a')

build() {
	unrar e -y ${pkgname}.rar
}

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -Dm644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF/

  install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
