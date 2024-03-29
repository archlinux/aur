# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-indexed-gzip
pkgver=1.8.7
pkgrel=1
pkgdesc="Drop-in replacement for the built-in python gzip.GzipFile class (IndexedGzipFile); written to allow fast random access of compressed NIfTI files"
_name=indexed_gzip
arch=('any')
url="https://github.com/pauldmccarthy/indexed_gzip"
license=('ZLIB')
groups=()
depends=('python' 'cython')
makedepends=('python-wheel' 'python-build' 'python-installer')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
# Switched from PyPi to GitHub due to persistent 404 errors
source=("https://github.com/pauldmccarthy/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('1c2ab8335a29a312e8c69afaa94aec56dd5910b14e6488e67ac1d400c62455fd')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}/" dist/*.whl
}
