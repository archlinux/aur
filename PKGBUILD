# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="sqlite-web"
pkgver=0.8.2
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
sha256sums=('c8ef170fa8a28da7da3042287120ef115b7fd1d217ae55b1518166192bb4037a')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
