# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Thomas Dziedzic
# Contributor: Mihai Militaru <mihai dot militaru at xmpp dot ro>
pkgname=tklib
pkgver=0.6
pkgrel=1
pkgdesc='Tklib specializes in utilities for GUI programming.'
arch=('i686' 'x86_64')
url='http://tcllib.sourceforge.net/'
license=('GPL')
depends=('tk' 'tcllib')
source=("http://core.tcl.tk/$pkgname/raw/$pkgname-$pkgver.tar.bz2?name=6a397dec6188148cf6a6fe290cf2bd92a9190c42")
md5sums=('92efb16228bc98d389156a7ac4fe4770')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make all
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
