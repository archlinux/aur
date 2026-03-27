# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="sqlite-web"
pkgver=0.7.2
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
sha256sums=('1ba0370fc599701f4c02318be4e390b16b003f5bfc454f33fbcc82f469ffe456')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
