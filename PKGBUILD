# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: David McInnis <davidm@eagles.ewu.edu>

pkgname="python-django-easy-thumbnails"
pkgver=2.10.1
pkgrel=2
pkgdesc="Highly configurable thumbnail creation and caching"
url="https://github.com/SmileyChris/easy-thumbnails"
depends=("python" "python-django" "python-pillow")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel")
license=("BSD")
arch=("any")
source=("$pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f4cc71fd0d21cb63a62c6bf1b9b7eb419b7f7aa219afab512d2c08bd4b6b9a94')

build(){
 cd "easy-thumbnails-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "easy-thumbnails-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}

