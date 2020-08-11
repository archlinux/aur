# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
pkgname=univga
pkgver=1.0
pkgrel=8
pkgdesc="(X11) VGA font with unicode glyphs by Dmitry Yu. Bolkhovityanov"
arch=('any')
url="http://www.inp.nsk.su/~bolkhov/files/fonts/univga/"
license=('custom:MIT')
makedepends=('fontforge')
depends=('fontconfig')
source=('http://www.inp.nsk.su/~bolkhov/files/fonts/univga/uni-vga.tgz'
        COPYING)
md5sums=('60fbba53cb0efec1363fcc5fb8c244d9'
         'd7a18e3868102a377d2b8ce92637826b')

build() {
  cd "$srcdir"/uni_vga
  fontforge -c 'open(argv[1]).generate(argv[2])' u_vga16.bdf u_vga16.otb
}

package() {
  cd "$srcdir"/uni_vga

  install -m 644 -D u_vga16.otb \
    "$pkgdir"/usr/share/fonts/local/u_vga16.otb

  install -m 644 -D "$srcdir"/COPYING \
    "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}

# vim:set ts=2 sw=2 et:
