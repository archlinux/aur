# Maintainer: Your Name <youremail@domain.com>
pkgname=python-collectd-transmission
_name=${pkgname#python-}
pkgver=3.5
pkgrel=1
pkgdesc="A python plugin for collectd to get stats from a runnning transmission server"
arch=(any)
url="https://pypi.org/project/collectd-transmission/#description"
license=('ISCL')
depends=('python' 'python-transmissionrpc')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
makedepends=(python-build python-installer python-wheel)
sha256sums=('dd397950194064f38bd8a14b5d12e967c470f547d18172599c26f06b0ab66993')

build() {
    cd ${_name//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd ${_name//-/_}-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
