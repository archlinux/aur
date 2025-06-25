# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="shot-scraper"
_pkgname="shot_scraper"
pkgver=1.8
pkgrel=1
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
b2sums=('aff1fac347a0bbfdc0d8bc47016315bfad98e35ebef81461aa8b8fab27a6dcfb54bf9281a4562460d945f52054b884e7eafcc3af72fde3283a6ba9f5e64e7418')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
