pkgname=python-mycgi
pkgver=0.0.4
pkgrel=1
pkgdesc='Python3 replacement for the deprecated cgi module'
arch=('any')
url='https://github.com/ronaaronson/mycgi'
license=('Apache-2.0')
depends=('python' 'python-multipart')
makedepends=(python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ronaaronson/mycgi/archive/refs/tags/${pkgver}.tar.gz")
sha1sums=('ccc7b185ebe6d44cadfed83380d9a13715b84c73')

build() {
    #cd $_name-$pkgver
    cd "mycgi-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    #cd $_name-$pkgver
    cd "mycgi-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
