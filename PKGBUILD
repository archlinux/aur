# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: Christian Dersch <chrisdersch@gmail.com>

pkgname=python2-stscitools
pkgver=2.1.14
pkgrel=1
pkgdesc="STSCI Tools"
arch=('i686' 'x86_64')
depends=('python2' 'python2-d2to1')
url="http://www.stsci.edu/institute/software_hardware/pyraf/"
source=(http://stsdas.stsci.edu/download/pyraf/pyraf-$pkgver.tar.gz)
license=('BSD')
md5sums=('c45bbfd016b43d7af6f4c9fe7e0603e0')

build() {
  cd $srcdir/pyraf-$pkgver/required_pkgs/stsci.tools
  python2 setup.py build
}

package() {
  cd $srcdir/pyraf-$pkgver/required_pkgs/stsci.tools
  python2 setup.py install --root $pkgdir
}
