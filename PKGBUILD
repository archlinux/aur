# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=shadow-icon-theme-git
_pkgname=Shadow
pkgver=v1.7.1.r1.g4edafb4
pkgrel=1
arch=('any')
pkgdesc="A flat colourful icon theme for GNOME 3.10+"
url="http://gnome-look.org/content/show.php/Shadow?content=170398"
makedepends=('git')
source=("git+https://github.com/rudrab/Shadow.git")
license=('GPL')
sha256sums=('SKIP')

pkgver () {
  cd $srcdir/$_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  mkdir -p $pkgdir/usr/share/icons/
  cp -a "$srcdir/Shadow" "$pkgdir/usr/share/icons/Shadow"
}
