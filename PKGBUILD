# Maintainer: ross <prwarren8@gmail.com>

pkgname=gabedit
pkgver=2.4.8
pkgrel=1
pkgdesc="A graphical user interface to computational chemistry packages"
arch=('i686' 'x86_64')
url="http://gabedit.sourceforge.net/"
license=('Custom')
depends=('gtkglext' 'gtk2')
makedepends=()
provides=('')
conflicts=('')
replaces=('')
_pkgver="${pkgver//\./}"
source=("http://prdownloads.sourceforge.net/gabedit/GabeditSrc$_pkgver.tar.gz")

md5sums=('dd8c9b90b6afe5407b0248f024236f2e')

build() {	
  cd "$srcdir/GabeditSrc$_pkgver/"
  cp platforms/CONFIG.unix CONFIG
  make
  #LDFLAGS+=/lib/libm.so.6 make
}
package(){

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/licenses/gabedit"
#  mkdir -p "$pkgdir/usr/share/applications/"

  install -D -m655 "$srcdir/GabeditSrc$_pkgver/gabedit" \
    "$pkgdir/usr/bin/"
  install -D -m644 "$srcdir/GabeditSrc$_pkgver/License" \
    "$pkgdir/usr/share/licenses/gabedit"
#  install -D -m644 "$srcdir/../gabedit.desktop" \
#    "$pkgdir/usr/share/applications/"
#  install -D -m644 "$srcdir/GabeditSrc$_pkgver/icons/Gabedit48.png" \
#    "$pkgdir/usr/share/pixmaps/gabedit.png"
}
