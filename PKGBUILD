# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Guoyi Zhang <GuoyiZhang at malacology dot net>

pkgname="mkdocs-static-i18n-plugin"
pkgver=1.2.3
pkgrel=1
pkgdesc="MkDocs i18n plugin using static translation markdown files"
url="https://github.com/ultrabug/mkdocs-static-i18n"
license=("MIT")
arch=("any")
depends=("mkdocs" "python-hatchling")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('e8cc090a37ae866c7b019b68e9e293f6b51260930d8833086ca650b48a07dd9dc6314a152b4c23052428a44b25517c3fbe1fc7ecc5ee42fe12a37b3f6889965c')
options=("!strip")

build(){
 cd "${pkgname/-plugin/}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${pkgname/-plugin/}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
