# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Thomas Zervogiannis <tzervo@gmail.com>
# Contributor: Loui Chang <louipc dot ist at gmail company>
# Contributor: rabyte <rabyte__gmail>

pkgname=tintin
pkgver=2.02.41
pkgrel=1
pkgdesc="A console-based MUD client"
arch=('i686' 'x86_64' 'aarch64')
url="http://tintin.sourceforge.net/"
license=('GPL3')
depends=('zlib' 'pcre' 'gnutls')
options=('strip')
source=(https://github.com/scandum/tintin/releases/download/$pkgver/tintin-$pkgver.tar.gz)
sha512sums=('fde1f8716ca36bd3f91e85bf46d7cb461224e425fc0423bd9c1089179869488701e804a883a58938697f6e57d1e05ef2ab1f632d14233bd5658ec1d7be5e9932')

build() {
  cd $srcdir/tt/src
  sh configure --prefix=/usr --enable-big5
  make

}

package() {
  cd $srcdir/tt/src
  install -m755 -D tt++ $pkgdir/usr/bin/tt++
  ln -sf tt++ $pkgdir/usr/bin/tintin

}
