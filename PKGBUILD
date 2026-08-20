# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="sqlite-web"
pkgver=0.8.0
pkgrel=1
pkgdesc="Web-based SQLite database browser"
url="https://github.com/coleifer/sqlite-web"
license=("MIT")
arch=("any")
provides=("sqlite_web")
conflicts=("python-sqlite-web")
depends=("python-flask"
         "python-peewee"
         "python-pygments")
makedepends=("python-build"
             "python-installer"
             "python-wheel"
             "python-setuptools")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('42e6970c2d5f7334fc47392f8ec976d55f6e407925297d699ec0b668e30002d6')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
