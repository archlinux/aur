# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: kevku <kevku@gmx.com>

pkgname=python-librtmp
pkgver=0.1.2
pkgrel=1
pkgdesc="Python interface to librtmp"
arch=('i686' 'x86_64')
url="https://github.com/chrippa/python-librtmp"
license=('Simplified BSD')
depends=('python-singledispatch' 'python-cffi' 'rtmpdump')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('207e539c04419cc2ea3380cfdee0c8576168079603168c7cc1807e9f4982e997')

build() {
  cd $pkgname-$pkgver

  python setup.py build
}

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
