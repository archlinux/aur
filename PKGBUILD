# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Guoyi Zhang <GuoyiZhang at malacology dot net>

pkgname="mkdocs-static-i18n-plugin"
pkgver=1.3.1
pkgrel=2
pkgdesc="MkDocs i18n plugin using static translation markdown files"
url="https://github.com/ultrabug/mkdocs-static-i18n"
license=("MIT")
arch=("any")
depends=("python" "mkdocs" "python-hatchling")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('c79c27e79e2aebcc065bcfb2bb73cd91de890b75c563d3a9ea1aa70696156e8822aa02f0d7e22a5dc511151083ba0f3be174c22a6cd2bb3dec40681d1f2ca4d9')
options=("!strip")

build(){
 cd "${pkgname/-plugin/}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${pkgname/-plugin/}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
