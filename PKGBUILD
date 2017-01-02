# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python2-resampy
pkgver=0.1.4
pkgrel=1
pkgdesc="Python library for efficient signal resampling"
url="https://github.com/bmcfee/resampy/"
depends=('cython2')
license=('ISC')
arch=('i686' 'x86_64')
source=("https://pypi.python.org/packages/73/74/b7e454722c402a48231b7b066289d0b472bd095500db8f253eb4e5cdf8d8/resampy-0.1.4.tar.gz")
md5sums=('cb413f93be03d0bebefad478d2b76e51')

build() {
  cd $srcdir/resampy-${pkgver}
  python2 setup.py build_ext -i
}

package() {
  cd $srcdir/resampy-${pkgver}
  python2 setup.py install --root="$pkgdir" --optimize=1 
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
