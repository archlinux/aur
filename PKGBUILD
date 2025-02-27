# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Guoyi Zhang <GuoyiZhang at malacology dot net>

pkgname="mkdocs-static-i18n-plugin"
pkgver=1.3.0
pkgrel=1
pkgdesc="MkDocs i18n plugin using static translation markdown files"
url="https://github.com/ultrabug/mkdocs-static-i18n"
license=("MIT")
arch=("any")
depends=("mkdocs" "python-hatchling")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('72d4781611bf9ee87733b9e36fd6fc509c6849a13a884630c581992c9261588a224118aef2d980438a8aef1ae44fa061aa512e605261668a9746241c2d37c5f2')
options=("!strip")

build(){
 cd "${pkgname/-plugin/}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${pkgname/-plugin/}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
