# Maintainer: Ricardo Constantino <ricardo@tsu.re>

pkgname=python-sgqlc
_name=${pkgname#python-}
pkgver=17.1
pkgrel=1
pkgdesc='Simple GraphQL Client'
arch=('any')
url='https://github.com/profusion/sgqlc'
license=('ISC')
depends=('python-graphql-core')
optdepends=()
makedepends=(
    'python-wheel'
    'python-installer'
    'python-build'
    )
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('93309057889894899819e6aefee544e3d9aa85e33f694b88fb657526c45df4a4')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
