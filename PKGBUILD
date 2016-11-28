# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-build
pkgname=python-${_pyname}
pkgver=2.0.10
pkgrel=1
pkgdesc="Commands and tools for building conda packages"
arch=('any')
url="http://conda.pydata.org/docs/building/build.html"
license=('BSD')
depends=('patchelf' 'python' 'python-conda' 'python-conda-verify' 'python-filelock' 'python-jinja' 'python-pkginfo' 'python-pycrypto' 'python-yaml')
provides=("$_pyname")
options=(!emptydirs)
source=(https://github.com/conda/$_pyname/archive/$pkgver.tar.gz)
sha512sums=('a1454ae1af0d5ebf4029f805bb2e7ae1c16df966c5cc8efba744b02df8c2cdf2e1c22d1e413c4130f6339479e8736ecb9d878d96d91483b42c7fb1b0dbb2060d')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
