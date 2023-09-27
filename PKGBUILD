# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-peewee-migrate"
pkgver=1.12.2
pkgrel=1
pkgdesc="Simple migration engine for Peewee"
url="https://github.com/klen/peewee_migrate"
license=("BSD3")
arch=("any")
provides=("peewee-migrate" "pw-migrate" "pw_migrate")
depends=("python-peewee")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('29b2082e490dd160b46eac5a73ff1c62f9600b497fef10255074cd660878a0482fea9e8c246bce6770c692bf83aa9ff4ec85c011303131812f1b92cadedba1ad')
options=("!strip")

build(){
 cd "peewee_migrate-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "peewee_migrate-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
