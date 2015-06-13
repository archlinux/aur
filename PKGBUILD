# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=rpgng
pkgver=0.5.5
pkgrel=1
pkgdesc="RPG Next Gen Editor is a lightweight RPG (Report Program Generator) editor based on the Eclipse platform."
arch=('i686' 'x86_64')
url="http://rpgnextgen.sourceforge.net/"
license=('GPL3')
depends=('java-environment' 'libxext' 'libxrender' 'fontconfig' 'xdg-utils')
source=("http://downloads.sourceforge.net/project/rpgnextgen/${pkgname}/${pkgname}-0.5/${pkgname}-${pkgver}-linux.gtk.x86.zip"
        "${pkgname}.sh"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('86f430c34be140b230ec50ff034bcadb'
         '7aef7fd3d1cdd55593fdffe3bf31afcb'
         '38ef35d53c9d4fbd60e2645377aaeaf7'
         '625bfd5c838cfb11c75ab609764163a5')
if [ "$CARCH" = 'x86_64' ]; then
  source[0]="http://downloads.sourceforge.net/project/rpgnextgen/${pkgname}/${pkgname}-0.5/${pkgname}-${pkgver}-linux.gtk.x86_64.zip"
  md5sums[0]='86424a8b6a903c7728f1fffa37851dff'
fi
install="${pkgname}.install"

package() {
  install -m 755 -D "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  cp -r "${srcdir}/${pkgname}" "${pkgdir}/usr/lib"

  install -m 644 -D "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -m 755 -D "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
