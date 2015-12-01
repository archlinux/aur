# Maintainer: Danny Dutton <duttondj@vt.edu>

pkgname=xfce4-composite-editor
_pkgname=Xfwm4CompositeEditor
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple GUI to control the various Xfce4 WM tweaks that are not available via the \"Window Manager Tweaks\" control 
panel."
arch=('i686' 'x86_64')
url="http://gtk-apps.org/content/show.php/Xfce4-Composite-Editor?content=149523"
license=("GPL3")
depends=('gtk2' 'libxfce4ui' 'xfconf')
optdepends=('xfce-theme-manager: Theme manager allowing configuration of themes, window borders, controls, icons and cursors for Xfce.')
makedepends=('pkg-config' 'make' 'autoconf')
source=("https://dl.dropboxusercontent.com/s/kpqqgn2ty7iocgi/$_pkgname-${pkgver}.tar.gz")
md5sums=('541fdd17a4d19166c7a362624a8ae453')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  ./autogen.sh --prefix="$pkgdir"/usr
  make
}

package() {
  install -m 755 -d "$pkgdir"/usr/bin "$pkgdir"/usr/share/applications "$pkgdir"/usr/share/pixmaps "$pkgdir"/usr/share/Xfwm4CompositeEditor
  cd "$srcdir"/$_pkgname-$pkgver
  make PREFIX="$pkgdir/usr" install
}
