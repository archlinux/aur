# Maintainer: plasmaofthedawn <plasmaofthedawn@gmail.com>

pkgname='python-factoriolib'
_name=${pkgname#python-}
pkgver=0.0.2
pkgrel=1
pkgdesc="Python package able to create and mainpulate factorio blueprint"
arch=(any)
url="https://gitlab.com/justin-guth.de/factoriolib"
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
conflicts=(${pkgname}-git)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('31c0467b6a4e9796d49edd853f57bf90d56f24c6d0a4b57991a59e66091562fa9354ed4ae6780899be5c5092cb50b998fb5af5dad6bd1dbc9a0b1eb6b2906adc')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
