# Maintainer: Letu Ren <fantasquex at gmail dot com>
# Contributor:: Ocelot <1112345@airmail.cc>

pkgname=python-censys
pkgver=2.2.4
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
sha256sums=('2bcace81886b490b8e9b89e9269ee78ec7442631f5ac6e3fae8c94421a2b9d09')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

