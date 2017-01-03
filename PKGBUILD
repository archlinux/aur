# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=snuggs
pkgname=('python2-snuggs')
pkgver=1.4.1
pkgrel=1
pkgdesc="Provide s-expressions for Numpy, for Python 2.7"
arch=('any')
url='https://github.com/mapbox/snuggs'
license=('MIT')
makedepends=('python2-setuptools')
depends=('python2-click' 'python2-numpy' 'python2-pyparsing')
options=(!emptydirs)
md5sums=('e05db13b4c45cb4fac8595adc0c99f15'
         '3cfb9a21d4ee8a39856d4773a933c177')
_pypi='https://pypi.python.org/packages'
_path='5d/a7/2628b376d794628655d13004091801f7f867366f0b08a52a741fc5bcb5fc'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz#md5=$md5sums"
        "https://raw.githubusercontent.com/mapbox/snuggs/$pkgver/LICENSE")

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
