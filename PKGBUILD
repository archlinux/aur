# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>
pkgname=python-pysubs2
_name=${pkgname#python-}
pkgver=1.6.1
pkgrel=1
pkgdesc='A Python library for editing subtitle files'
arch=(any)
url=https://pypi.org/project/pysubs2
license=(MIT)
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0261611e71735ff7763972c519c72593c8063efcb9039c54af65f31b81cec116')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
