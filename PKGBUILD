# Maintainer: Ricardo Constantino <ricardo@tsu.re>

pkgname=python-sgqlc
_name=${pkgname#python-}
pkgver=16.1
pkgrel=2
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
sha256sums=('21591009345b116b43a7a7d3995edc25dc2d14092273028205b86d07843a19ac')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
