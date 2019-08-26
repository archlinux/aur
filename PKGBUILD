# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-kealib')
_kea=1.4.11
pkgver=0.1_$_kea
pkgrel=1
pkgdesc="Python library to access parts of kealib not exposed by GDAL"
arch=('x86_64')
url='http://kealib.org'
license=('MIT')
makedepends=('python-setuptools')
depends=('kealib' 'python')
options=(!emptydirs)
source=("https://bitbucket.org/chchrsc/kealib/get/kealib-$_kea.tar.bz2")
sha256sums=('c39aa8009e2504ed461e943974a1478ec2b96c0b04516d2386317c191ffce5aa')
_srcpath=chchrsc-kealib-74ca085025e9

build() {
  cd "$srcdir/$_srcpath/python"
  python setup.py build
}

package() {
  cd "$srcdir/$_srcpath/python"
  python setup.py install --root="$pkgdir/" --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
