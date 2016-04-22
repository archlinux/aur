# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-build
pkgname=python-${_pyname}
pkgver=1.20.1
pkgrel=1
pkgdesc="Commands and tools for building conda packages"
arch=('any')
url="http://conda.pydata.org/docs/building/build.html"
license=('BSD')
groups=()
depends=('patchelf' 'python' 'python-conda')
makedepends=()
provides=("$_pyname")
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://github.com/conda/$_pyname/archive/$pkgver.tar.gz)
sha512sums=('8bb33864b28bb5725f5574610f1cf530cf5670689d0e8086651c8f50986517ca044b2116f744a90d2d2166e0b5ed0759c5d7d289296a508cf0ad16b25a9376c3')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  echo $pkgver > .version
  #CONDA_DEFAULT_ENV=''
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
