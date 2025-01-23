# Maintainer: Ananas <ananas@ananas.moe>
pkgname=python-decouple
pkgver="3.8"
pkgrel=1
pkgdesc="Strict separation of config from code."
arch=("any")
url="https://github.com/HBNetwork/python-decouple"
license=("MIT")
cdepends=(
	"python"
)
makedepends=('python-setuptools')
source=(
	"${pkgname}-${pkgver}.zip::https://github.com/HBNetwork/python-decouple/archive/refs/tags/v$pkgver.zip"
)
sha256sums=('0953232ec57561052830943071911269a7487fcf56facc1099aa25f1174dfc76')

build() {
    cd $pkgname-$pkgver
    python setup.py build
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}