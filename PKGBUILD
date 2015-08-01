# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=qsampler
pkgver=0.3.1
pkgrel=1
pkgdesc="LinuxSampler Qt GUI"
arch=('i686' 'x86_64')
url="http://qsampler.sourceforge.net/"
license=('GPL')
depends=('qt5-base' 'qt5-tools' 'linuxsampler' 'liblscp')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('b1e20e50fff5f6e7907355001011eb4c')

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
