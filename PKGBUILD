# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-build
pkgname=python-${_pyname}
pkgver=3.10.4
pkgrel=2
pkgdesc="Commands and tools for building conda packages"
arch=('any')
url="http://conda.pydata.org/docs/building/build.html"
license=('BSD')
depends=(
  'patchelf'
  'python'
  'python-beautifulsoup4'
  'python-conda'
  'python-conda-verify'
  'python-filelock'
  'python-glob2-git'
  'python-jinja'
  'python-pkginfo'
  'python-requests'
  'python-yaml'
)
provides=("$_pyname")
options=(!emptydirs)
source=(https://github.com/conda/$_pyname/archive/$pkgver.tar.gz)
sha512sums=('68205fdde81d18df5faf0d027529f4b684e0b9c98ee444e072ec4986dff1285cd83f75490071119e92d4e4983fb0fe409a6cba2523f5d7a5bccf041c16cb9f55')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
