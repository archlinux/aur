# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="shot-scraper"
_pkgname="shot_scraper"
pkgver=1.8
pkgrel=2
pkgdesc="A command-line utility for taking automated screenshots of websites"
url="https://shot-scraper.datasette.io/"
license=("Apache-2.0")
arch=("any")
depends=("python"
         "python-click-default-group"
         "python-playwright")
makedepends=("python-build"
             "python-installer"
             "python-wheel"
             "python-setuptools")
options=("!strip")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('7d525fefc6e9f727f644a9ff5a90c57b2529ef8ba75342d42f602263da929421f1462252baade41941a8d8b5920a26707c60ec1a2e13bb8b310f961daca098e9')

build(){
 cd "$_pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
