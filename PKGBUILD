# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-peewee-migrate"
pkgver=1.13.0
pkgrel=2
pkgdesc="Simple migration engine for Peewee"
url="https://github.com/klen/peewee_migrate"
license=("BSD3")
arch=("any")
provides=("peewee-migrate" "pw-migrate" "pw_migrate")
depends=("python-peewee")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel" "python-poetry-core")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('6b13a936445524102916d5bc2d40cc859e205e445a22b003149f6c71509799477d9b5fe6b8db645305043734043cef1afabebf457560b158561f6f70565b3912')
options=("!strip")

build(){
 cd "peewee_migrate-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "peewee_migrate-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
