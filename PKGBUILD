# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgname="mkdocs-minify-plugin"
pkgver=0.5.0
pkgrel=1
pkgdesc="A mkdocs plugin to minify the HTML of a page before it is written to disk"
url="https://github.com/byrnereese/mkdocs-minify-plugin"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-minify-plugin")
replaces=("python-mkdocs-minify-plugin")
depends=("mkdocs" "python-htmlmin" "python-jsmin" "python-csscompressor")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a7a6769e59d541be4b258fc3f4757a9e9d98f665cd17ab2c4961a5c70d196fa7')

build(){
    cd "$pkgname-$pkgver"
    python setup.py build
}

package(){
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
