# Maintainer: Twann <twann@ctemplar.com>

pkgname=python-argumentor
pkgver=0.0.5
pkgrel=1
provides=("$pkgname")
pkgdesc="A simple, copylefted, lightweight library to work with command-line arguments in Python"
url="https://codeberg.org/twann/${pkgname}"
arch=("any")
license=("GPL3")
makedepends=("python>=3" "python-setuptools")
depends=("python>=3")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/twann/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=("8664b5bc18a4bdf69d8ec4cd0df1d9b9de4323bd01acc96b131ab8a139d733a8aebcc46fa5799da331f7f5283f9813f747e08756e9bbea3f6a984949f1c8bc4b")

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
