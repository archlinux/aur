# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="sqlite-web"
pkgver=0.6.3
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
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
b2sums=('bf7185a555b14444844f9031a88aa23271beebd27dfd7787b38fcd32e9e2a8c8aa76170f07d263e95cb7c4b1e857be7bea00c1d55b2f21b5e594ed5a14cdd6f0')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
