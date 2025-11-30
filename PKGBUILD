# Maintainer: Camelia Lavender <cam (at) camelia (dot) dev>

pkgname=python-argumentor
pkgver=2.0.0
pkgrel=1
pkgdesc="a simple and lightweight library to build complex command-line tools"
url="https://codeberg.org/camelia/python-argumentor"
arch=("any")
license=("LGPL3")
makedepends=("python>=3" "python-setuptools" "python-build" "python-installer" "python-wheel")
depends=("python>=3")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/camelia/python-argumentor/archive/${pkgver}.tar.gz")
sha512sums=("e61557005df9b56fa8b44547726536525fc32fdd5474be460f7062ee14d84ca6f3ebfc98781212210afd750001f01904bad95b64023582eb68b192acc36a69fd")

build()
{
        cd "$srcdir/$pkgname"
	python -m build
}

package()
{
        cd "$srcdir/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
