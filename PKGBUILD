# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=vtfedit
pkgver=1.3.3
pkgrel=7
pkgdesc='A .NET graphical frontend for VTFLib'
arch=('any')
url='https://nemstools.github.io/pages/VTFLib-Download.html'
license=('GPL2' 'LGPL2.1')
depends=('wine' 'winetricks' 'zenity')
source=('http://nemstools.github.io/files/vtfedit133.zip'
        "${pkgname}.sh"
        "${pkgname}.png"
        "${pkgname}.desktop"
        'x-vtf.xml')
sha256sums=('eb2329d105f57057f6fc6d38c34a741c2abc9f05125e80e8b0f8ab5f269a3c49'
            'e879ea5e01c4c339ec828ab94d747b3266a963355d1843f1b7d0770b16d9698a'
            '269aa8fecd703b65396750d266f0034df747fbcc9caf4285ea8b506c013e8edb'
            '93ed7f959b6b7d463d605096d53f64b87a0cba7829eb6d7faead54f2875422e2'
            '2ef3ee8a61eff0014084187e250191b332b5cee1e916df627c5571776ee6868d')

package() {
  install -Dd "$pkgdir/usr/share/${pkgname}"
  cp -r "$srcdir/x86" "$pkgdir/usr/share/${pkgname}"

  install -D "$srcdir/Readme.txt" "$pkgdir/usr/share/${pkgname}"
  install -D "$srcdir/GPL.txt" "$pkgdir/usr/share/licenses/${pkgname}"
  install -D "$srcdir/LGPL.txt" "$pkgdir/usr/share/licenses/${pkgname}"
 
  install -Dm0644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -Dm0644 "$srcdir/${pkgname}.png" "$pkgdir/usr/share/${pkgname}"
  install -Dm0644 "$srcdir/x-vtf.xml" "$pkgdir/usr/share/mime/packages/x-vtf.xml"
  install -Dm0755 "$srcdir/${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
}
