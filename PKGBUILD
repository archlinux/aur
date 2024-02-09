# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-pgsanity"
_name="${pkgname#python-}"
pkgver=0.2.9
pkgrel=1
pkgdesc="Check syntax of sql for PostgreSQL"
arch=(any)
url="https://github.com/markdrago/pgsanity"
license=('MIT')
depends=()
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('d1ae0d2f08f2fd5188882fabc68f09f532230e9689602ad195dfe0cf39172760c7e26c1989489a60cf03ceeec4b75b367bfcbcc99f0c9e6ea381000b4af3c41a')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
