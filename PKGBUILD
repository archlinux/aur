# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=twelf
pkgver=1.7.1
pkgrel=1
pkgdesc='An implementation of the logical framework LF'
url='http://twelf.org/'
license=('BSD')
arch=('i686' 'x86_64')
depends=('bash' 'gmp' 'smlnj')
makedepends=('smlnj')
provides=('twelf')
conflicts=('twelf-git')
install=$pkgname.install
source=("http://twelf.org/releases/twelf-src-$pkgver.tar.gz")
md5sums=('1cb556366dd534f8c1c858614dd57e16')

build() {
  cd "$pkgname"
  make smlnj
}

package() {
  cd "$pkgname"
  install -d -m755 $pkgdir/opt/twelf $pkgdir/usr/bin
  cp -r . $pkgdir/opt/twelf
  ln -s /opt/twelf/bin/twelf-server $pkgdir/usr/bin/twelf-server
}
