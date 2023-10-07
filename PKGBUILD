# Maintainer: Letu Ren <fantasquex at gmail dot com>
# Contributor:: Ocelot <1112345@airmail.cc>

pkgname=python-censys
pkgver=2.2.7
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
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('abec858e5be89c45a60477bd7e51412fee7f55917325b11c3cd970298de3e2bd')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

