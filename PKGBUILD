# Maintainer: Homer Xing <homer dot hsing @t gmail dot com>

projname=flynt
pkgname=python-$projname
pkgver=0.76
pkgrel=1
epoch=
pkgdesc="automatically convert old string literal formatting to f-strings"
arch=("any")
url="https://github.com/ikamensh/flynt"
license=("MIT")
groups=()
depends=("python" "python-astor")
makedepends=("python-setuptools")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/ikamensh/flynt/archive/refs/tags/$pkgver.tar.gz")
noextract=()
validpgpkeys=()
b2sums=("e1f43f75435350907e783cd5ee2749d5bf966c741883ab2093ea8edcebe8d95f9169a9655c9b5d1a3c865d8531522b5c9f5c2f4637afebb847bbda1321982d05")

build() {
  cd "${srcdir}/${projname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${projname}-${pkgver}"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}