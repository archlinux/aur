# Maintainer: Sapphira Armageddos <shadowkyogre.public+aur@gmail.com>
pkgname=pyching
pkgver=1.2.2
pkgrel=1
pkgdesc="pyChing is a program that allows you to 'consult' the I Ching using the coin oracle and then to look up a brief interpretation."
arch=(any)
url="http://pyching.sourceforge.net/"
license=('GPL')
depends=('python2')
source=("http://sourceforge.net/projects/pyching/files/pyChing/${pkgver}/${pkgname}-${pkgver}.tar.gz"
"pyching.desktop")

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/usr/{bin,share/{pixmaps,applications,pyching,man/man1}}
  install -Dm644 pyching.1 "$pkgdir/usr/share/man/man1/pyching.1"
  install -Dm755 pyching.sh "$pkgdir/usr/bin/pyching"
  sed -e 's|#! /usr/bin/env python|#! /usr/bin/env python2|g' -i pyching.py
  install -m644 *.py icon.xbm "$pkgdir/usr/share/pyching"
  install -m644 pyching.png "$pkgdir/usr/share/pixmaps"
  install -m644 pyching.desktop "$pkgdir/usr/share/applications"
  chmod +x "$pkgdir/usr/share/pyching/pyching.py"
}

# vim:set ts=2 sw=2 et:
md5sums=('a11f3b34d195ed72514ffad68912329c'
         'e014b26d6bd3d3d4b037ef8563728ded')
