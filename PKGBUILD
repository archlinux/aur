# Maintainer: Twann <twann@ctemplar.com>

pkgname=python-argumentor
pkgver=0.0.2
pkgrel=1
provides=("$pkgname")
pkgdesc="A library to work with command-line arguments"
url="https://codeberg.org/twann/${pkgname}"
arch=("any")
license=("GPL3")
makedepends=("python>=3" "python-setuptools")
depends=("python>=3")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/twann/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=("3137b966c5af7c1da3885b978cb002fd0f892b6b880f695f5cd10653162f6724d87c853d9054ffc551f0b8c3fb8527c072c2ee0ae69f260dea51133d7aa23b79")

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
