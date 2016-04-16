# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: AlexanderR <alexander r at gmx com>

pkgname=junipersknot
pkgver=1.0
pkgrel=4
pkgdesc="A short kinetic novel crafted in a month by Dischan, Juniper's Knot is a story told from dual perspectives: that of a demon and a boy."
arch=('any')
url="http://junipersknot.dischan.org/"
license=('custom')
depends=('renpy' 'python2-pygame')
options=(!strip)
source=("JunipersKnot_en_1.0_lin.tar.bz2::https://dischan.co/downloads/JunipersKnot_en_1.0_lin.tar.bz2"
	dischan_JunipersKnot.desktop
	junipersknot
	junipersknot.png)
md5sums=('3318de6e4c5952271961d757bdd5fddf'
         'dec96343fbf164e5e9d6c1b29f31b519'
         '8d6decca098b103db2c3d6709a7a6332'
         'c3fd43e5bacc7f9ebbda0971a3e5b2d0')

package() {
  cd "$srcdir/Juniper's Knot-linux-x86"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -m644 README.txt SOUNDCREDITS.txt "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 DISCHANLICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/DISCHANLICENSE.txt"
  cd ..
  mv "Juniper's Knot-linux-x86"  "$pkgdir/usr/share/$pkgname"
  mkdir "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/junipersknot" "$pkgdir/usr/bin/junipersknot"
  install -Dm644 "$srcdir/junipersknot.png" "$pkgdir/usr/share/pixmaps/junipersknot.png"
  install -Dm644 "$srcdir/dischan_JunipersKnot.desktop" "$pkgdir/usr/share/applications/dischan_JunipersKnot.desktop"
}
