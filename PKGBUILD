# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgname="mkdocs-minify-plugin"
pkgver=0.4.1
pkgrel=1
pkgdesc="A mkdocs plugin to minify the HTML of a page before it is written to disk"
url="https://github.com/byrnereese/mkdocs-minify-plugin"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-minify-plugin")
replaces=("python-mkdocs-minify-plugin")
depends=("mkdocs" "python-htmlmin>=0.1.4" "python-jsmin>=3.0.0")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6879779a112f2cd6c43b976c4c808dcb1194c5e131f6063b2155b147fbcb2615')

build(){
    cd "$pkgname-$pkgver"
    python setup.py build
}

package(){
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
