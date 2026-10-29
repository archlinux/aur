# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: David McInnis <davidm@eagles.ewu.edu>

pkgname="python-django-sortedm2m"
pkgver=4.0.0
pkgrel=1
pkgdesc="A transparent sorted ManyToMany field for django"
url="https://github.com/jazzband/django-sortedm2m"
depends=("python-django")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel")
license=("BSD")
arch=("any")
source=("$pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b73bfa2d483f17149746fcea00f6e37a919074fd0d74e5cfc245d5c7c32492e3')

build(){
 cd "django-sortedm2m-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "django-sortedm2m-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
