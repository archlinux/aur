# Maintainer: Homer Xing <homer dot hsing @t gmail dot com>

projname=flynt
pkgname=python-$projname
pkgver=0.69
pkgrel=2
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
b2sums=("f456b83b0b2ca2a8c2ab9fc2d7bb3ab8b4bcf0c348d521da43c4dc599544620bc513632634c24571fa0b6ae339fabdc8377793b4603af5ca41c9f90050700292")

build() {
  cd "${srcdir}/${projname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${projname}-${pkgver}"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}