# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: David McInnis <davidm@eagles.ewu.edu>

pkgname="python-django-sortedm2m"
pkgver=4.1.0
pkgrel=1
pkgdesc="A transparent sorted ManyToMany field for django"
url="https://github.com/jazzband/django-sortedm2m"
depends=("python" "python-django")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel")
license=("BSD")
arch=("any")
source=("$pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('804abaf644904be79dd6e39aee231d7aa681a1c5c22d134412eb1f9cc0fceb50')

build(){
 cd "django-sortedm2m-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "django-sortedm2m-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
