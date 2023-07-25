# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgname="mkdocs-minify-plugin"
pkgver=0.7.0
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
sha256sums=('1773b2c2fc7cad5cd9bdaf4c51f1237d23f36780aedcaf20205b76d865eed2d9')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
 python -m installer --destdir="$pkgdir" dist/*.whl
}
