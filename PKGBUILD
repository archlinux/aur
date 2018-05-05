# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-build
pkgname=python-${_pyname}
pkgver=3.10.1
pkgrel=1
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
sha512sums=('f5d14fe33fec4c618bd3080e2b4cd420d84111311536f0168523704670df1507b8ab63c8c6e320be0dc50fabfa4c077698910e06b8a56533cf22078073ccad22')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
