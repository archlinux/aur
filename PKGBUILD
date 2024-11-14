# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-indexed-gzip
pkgver=1.8.8
pkgrel=2
pkgdesc="Drop-in replacement for the built-in python gzip.GzipFile class (IndexedGzipFile); written to allow fast random access of compressed NIfTI files"
_name=indexed_gzip
arch=('x86_64')
url="https://github.com/pauldmccarthy/indexed_gzip"
license=('ZLIB')
groups=()
depends=('python' 'cython')
makedepends=('python-wheel' 'python-build' 'python-installer' 'python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
# Switched from PyPi to GitHub due to persistent 404 errors
source=("https://github.com/pauldmccarthy/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('764d05589e889a99a1527e4a8ed202375fba9902d97fd1417320448452b81a1a')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}/" dist/*.whl
}
