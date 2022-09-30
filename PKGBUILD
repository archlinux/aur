# Maintainer:  Liam Timms <timms5000@gmail.com>
pkgname=python-looseversion
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=1
pkgdesc="Version numbering for anarchists and software realists"
arch=('any')
url='https://github.com/effigies/looseversion'
license=('PSFL2')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=()
source=("${_name}-${pkgver}.tar.gz::https://github.com/effigies/${_name}/archive/${pkgver}.tar.gz")
md5sums=('02013c840c53c939e735830fd6baddd0')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

