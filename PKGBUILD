# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=bakonf
arch=('i686' 'x86_64')
pkgver=0.6.0
pkgrel=5
pkgdesc="Tool that creates a backup of selected configuration files and information about running system"
license=('gpl')
url="http://www.nongnu.org/bakonf/"
depends=('python' 'py3-bsddb')
source=("http://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz" "pacmandb.xml")
md5sums=('21925237229175dc1dd31d37911c4dad'
         'd98dc1a8d572b562214689f9e3ed0cd2')

build() {
#sed -i '1s/python/python2/' $srcdir/$pkgname-$pkgver/$pkgname
cp pacmandb.xml $pkgname-$pkgver/sources/
}

package() {
cd $srcdir/$pkgname-$pkgver
make DESTDIR=$pkgdir/ install
}
