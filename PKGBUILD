# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-build
pkgname=python-${_pyname}
pkgver=2.0.9
pkgrel=2
pkgdesc="Commands and tools for building conda packages"
arch=('any')
url="http://conda.pydata.org/docs/building/build.html"
license=('BSD')
depends=('patchelf' 'python' 'python-conda' 'python-conda-verify' 'python-filelock' 'python-jinja' 'python-pkginfo' 'python-pycrypto' 'python-yaml')
provides=("$_pyname")
options=(!emptydirs)
source=(https://github.com/conda/$_pyname/archive/$pkgver.tar.gz)
sha512sums=('5bbb1518176f7a871de876af7d177f80f075177b8312457e028d85965e78cbcaea49c6335c7c4b81ec607f4c070b146226ae070d35b489864c531f72f99f5c08')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
