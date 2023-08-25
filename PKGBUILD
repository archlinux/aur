# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: David McInnis <davidm@eagles.ewu.edu>

pkgname="python-django-sortedm2m"
pkgver=3.1.1
pkgrel=1
pkgdesc="A transparent sorted ManyToMany field for django"
url="https://github.com/jazzband/django-sortedm2m"
depends=("python-django")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel")
license=("BSD")
arch=("any")
source=("$pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('06591bbd1a531b25f838fd3a4ce93dfe9a527982dc82015530b1fc29655ed80c')

build(){
 cd "django-sortedm2m-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "django-sortedm2m-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
