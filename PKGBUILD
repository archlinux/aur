# Maintainer: Twann <twann@ctemplar.com>

pkgname=python-argumentor
pkgver=0.0.3
pkgrel=1
provides=("$pkgname")
pkgdesc="A simple, copylefted, lightweight library to work with command-line arguments in Python"
url="https://codeberg.org/twann/${pkgname}"
arch=("any")
license=("GPL3")
makedepends=("python>=3" "python-setuptools")
depends=("python>=3")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/twann/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=("5ecd279cc2ebd32a6c6cf7895964fcd11f5c9d4e357ae35671a5a86ad586cfffb1d98ec243445f8d7025e4d8f826ce74bdef97991f3a107acfad48440b249dcc")

build()
{
        cd "$srcdir/$pkgname"
        python setup.py clean --all
	python setup.py build
}

package()
{
        cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
