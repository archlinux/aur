# Maintainer: Homer Xing <homer dot hsing @t gmail dot com>

projname=flynt
pkgname=python-$projname
pkgver=0.77
pkgrel=1
epoch=
pkgdesc="automatically convert old string literal formatting to f-strings"
arch=("any")
url="https://github.com/ikamensh/flynt"
license=("MIT")
groups=()
depends=("python" "python-astor")
makedepends=("python-build" "python-installer")
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
b2sums=("a02016bf370916744e9666fac2628137a4dfdabeb4843fc717a945ffad3a80762d28cdd791b4da0b9a79577e395cfcd8ae6e6c8f7d66ef5b5bc7ce1499c70a65")

build() {
  cd "${srcdir}/${projname}-${pkgver}"
  python3 -m build
}

package() {
  cd "${srcdir}/${projname}-${pkgver}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}