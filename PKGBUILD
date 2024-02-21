# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="shot-scraper"
pkgver=1.4
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
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
b2sums=('b6d8378968e147b88d740a35afd5fb222660e2aa44d498304bbd589a23c749fbb30fc010e47d654d1bdfe16ffeca68f8b01e4e4becadc9c1c3e392f5ce96dee1')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
