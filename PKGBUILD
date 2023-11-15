# Maintainer: Letu Ren <fantasquex at gmail dot com>
# Contributor:: Ocelot <1112345@airmail.cc>

pkgname=python-censys
_name=censys-python
pkgver=2.2.9
pkgrel=1
pkgdesc="An easy-to-use and lightweight API wrapper for Censys APIs."
arch=('any')
url="https://github.com/censys/censys-python"
license=('APACHE')
depends=(
  'python'
  'python-requests'
  'python-urllib3'
  'python-backoff'
  'python-rich'
  'python-argcomplete'
)
makedepends=('python-build' 'python-installer' 'python-poetry-core')
source=("https://github.com/censys/censys-python/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('79337be9700e302fc358896424fa5bfeebd48eb70703cad352c575ba1a9fab05')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

