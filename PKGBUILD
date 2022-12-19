# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>
pkgname=python-pysubs2
_name=${pkgname#python-}
pkgver=1.6.0
pkgrel=2
pkgdesc='A Python library for editing subtitle files'
arch=(any)
url=https://pypi.org/project/pysubs2
license=(MIT)
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ed6ff66eaf7d3bc98bb0970c6cd4bf7042a70a2da6e804ff03be4cd9c3179a4f')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
