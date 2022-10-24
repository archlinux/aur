# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgname="mkdocs-minify-plugin"
pkgver=0.6.1
pkgrel=1
pkgdesc="A mkdocs plugin to minify the HTML of a page before it is written to disk"
url="https://github.com/byrnereese/mkdocs-minify-plugin"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-minify-plugin")
replaces=("python-mkdocs-minify-plugin")
depends=("mkdocs" "python-htmlmin" "python-jsmin" "python-csscompressor")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1fb88f792095483b47983b95719465fae3168fcd1a28945beb53511054fb1f15')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
