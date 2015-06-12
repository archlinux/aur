# Maintainer: Jose Riha < jose 1711 gmail com >
# based on comment made by fnord0
# Contributor: Idiot <sunshine1985115 gmail com>
# Contributor: Phylu <maierjanosch gmail com>

pkgname=pylibpcap
pkgver=0.6.4
pkgrel=2
pkgdesc="Python module for the libpcap packet capture library, based on the original python libpcap module by Aaron Rhodes."
url="http://pylibpcap.sourceforge.net/"
license=('BSD')
arch=('any')
depends=(python2 libpcap)
makedepends=(python2 libpcap)
source=(http://downloads.sourceforge.net/project/pylibpcap/pylibpcap/$pkgver/pylibpcap-$pkgver.tar.gz)
md5sums=('7ebcaa72f998f85744be226b91d88aa3')
 
build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py config
  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}
