# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-build
pkgname=python-conda-build
pkgver=3.10.5
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
sha512sums=('8ef1040b5df099128fb0eb061fae356fe958d110249c25f06cdd6f7bc4f266cd388a8a10ad087db1e0462ff01dcb86ee3ed7c401096fd5605d20a53a80641a65')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
