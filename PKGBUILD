# Maintainer Ruijie Yu

pkgname=python-typish
_pkgname="${pkgname#python-}"
pkgver=1.9.1
pkgrel=1
pkgdesc='Functionality for types'
arch=(any)
url="https://github.com/ramonhagenaars/$_pkgname"
license=(MIT)

depends=(
    'python>=3'
)

makedepends=(
    'python-pip'
    'python-wheel'
)

checkdepends=(
    'python-numpy'
    # 'python-nptyping>=1.1.0'
    'python-pycodestyle'
    'python-pylint'
    'mypy'
    'python-pytest'
    'python-coverage'
    # 'python-codecov'
)

source=(
    "$url/archive/v$pkgver.tar.gz"
)
sha512sums=('867694f5fee9387b14cc94d3741ada256b8a32db931f01576a4d38d78fd237fe708f8e890703db21ccb790ace5ff178a09cda28d8ab9164b6ecbb105eeefc670')

_extracted="$_pkgname-$pkgver/"

check() {
    :
}

package() {
    pip install --no-deps --root "${pkgdir}" --compile "$srcdir/$_extracted"
}

