# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgname="mkdocs-minify-plugin"
pkgver=0.7.2
pkgrel=1
pkgdesc="A mkdocs plugin to minify the HTML of a page before it is written to disk"
url="https://github.com/byrnereese/mkdocs-minify-plugin"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-minify-plugin")
replaces=("python-mkdocs-minify-plugin")
depends=("mkdocs" "python-htmlmin2>=0.1.13" "python-jsmin" "python-csscompressor")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('31bccca289143a2936e8f9d2dd55986a4a2d1545251b376e8c6677b2188414ac')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
 python -m installer --destdir="$pkgdir" dist/*.whl
}
