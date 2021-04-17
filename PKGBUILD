# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=vtfedit
pkgver=1.3.3
pkgrel=5
pkgdesc='A .NET graphical frontend for VTFLib'
arch=('x86_64')
url='https://nemstools.github.io/pages/VTFLib-Download.html'
license=('GPL2' 'LGPL2.1')
depends=('wine' 'winetricks' 'zenity')
source=('http://nemstools.github.io/files/vtfedit133.zip'
        "${pkgname}.sh"
	"${pkgname}.png"
	"${pkgname}.desktop"
	'x-vtf.xml')
md5sums=('9a510e0b4a4a69293059a054cd116f29'
         'c5f4f4f4c352b63aa995dda00c7cc1da'
         '0ee76e48e7ee98b870aa359cd54c483a'
         'c202c94be95e951ca7659c2ad3a4115c'
         '11d66d71d41f2ce92de9d09f7c86c67f')

package() {
  install -Dd "$pkgdir/usr/share/${pkgname}"
  cp -r "$srcdir/x86" "$pkgdir/usr/share/${pkgname}"

  install -D "$srcdir/Readme.txt" "$pkgdir/usr/share/${pkgname}"
  install -D "$srcdir/GPL.txt" "$pkgdir/usr/share/licenses/${pkgname}"
  install -D "$srcdir/LGPL.txt" "$pkgdir/usr/share/licenses/${pkgname}"
 
  install -Dm0644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -Dm0644 "$srcdir/x-vtf.xml" "$pkgdir/usr/share/mime/packages/x-vtf.xml"
  install -Dm0755 "$srcdir/${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
}
