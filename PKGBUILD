# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-build
pkgname=python-${_pyname}
pkgver=3.0.30
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
  'python-pkginfo'
  'python-requests'
  'python-yaml'
)
provides=("$_pyname")
options=(!emptydirs)
source=(https://github.com/conda/$_pyname/archive/$pkgver.tar.gz)
sha512sums=('9f08b30dc7c4e585c453bbcf7679e834c51ff2d1ac47fdf07b9aaf897b88d9a2638b835877ce0a007a2f8591aa58d3fb7ccec0fc1a643501dce52ce35c74ea86')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
