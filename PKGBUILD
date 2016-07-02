# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=qsampler
pkgver=0.4.0
pkgrel=2
pkgdesc="LinuxSampler Qt GUI"
arch=('i686' 'x86_64')
url="http://qsampler.sourceforge.net/"
license=('GPL')
depends=('qt5-base' 'qt5-tools' 'qt5-x11extras' 'linuxsampler' 'liblscp')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('02a39ca85bf13a18646ff80161949e2e')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

 # sed -i 's/ac_qtdirs=.*/ac_qtdirs="qt4"/' configure
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
