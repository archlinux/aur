# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Thomas Dziedzic
# Contributor: Mihai Militaru <mihai dot militaru at xmpp dot ro>
pkgname=tklib
pkgver=0.8
pkgrel=1
pkgdesc='Tklib specializes in utilities for GUI programming.'
arch=('i686' 'x86_64')
url="https://core.tcl-lang.org/tklib/home"
license=('GPL')
depends=('tk' 'tcllib')
source=(https://github.com/tcltk/tklib/archive/refs/tags/tklib-$pkgver.tar.gz)
sha256sums=('8192087094fdb6c0fbea4c8f995d26631e8c0a230697179863ba817781c31da9')

build() {
  cd $pkgname-$pkgname-$pkgver
  ./configure --prefix=/usr
  make all
}

package() {
  cd $pkgname-$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
