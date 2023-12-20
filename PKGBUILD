# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Guoyi Zhang <GuoyiZhang at malacology dot net>

pkgname="mkdocs-static-i18n-plugin"
pkgver=1.2.0
pkgrel=1
pkgdesc="MkDocs i18n plugin using static translation markdown files"
url="https://github.com/ultrabug/mkdocs-static-i18n"
license=("MIT")
arch=("any")
depends=("mkdocs" "python-hatchling")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('27cdb34f6de8d16b915a7237df3be65dbe7e565531db0431086f7e6ce292ef32118588afb79a9e90667622d9cf5de63052db47a9b15290d0544c25066fd53ce1')
options=("!strip")

build(){
 cd "${pkgname/-plugin/}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${pkgname/-plugin/}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
