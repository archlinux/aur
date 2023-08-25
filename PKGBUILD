# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: David McInnis <davidm@eagles.ewu.edu>

pkgname="python-django-easy-thumbnails"
pkgver=2.8.5
pkgrel=1
pkgdesc="Highly configurable thumbnail creation and caching"
url="https://github.com/SmileyChris/easy-thumbnails"
depends=("python-django" "python-pillow")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel")
license=("BSD")
arch=("any")
source=("$pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5d9b53a18644f550b9c0d4e179146cfadfcc1d735024116a7e8890c7d738fe0b')

build(){
 cd "easy-thumbnails-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "easy-thumbnails-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}

