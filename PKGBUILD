# Maintainer: Sauyon Lee <me at sjl dot re>
pkgname=codeql
pkgver=2.3.2
pkgrel=1
epoch=
pkgdesc="The CLI tool for GitHub's CodeQL"
arch=('i686' 'x86_64')
url="https://github.com/codeql"
license=('custom')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-v$pkgver.zip::https://github.com/github/codeql-cli-binaries/releases/download/v$pkgver/$pkgname-linux64.zip")
sha256sums=('42f1dd43b5e133fb0fbb8f1740e418523ff2cfe6c58fce0cd285697b1e0035d5')

noextract=()

prepare() {
  cd "$srcdir"

  ln -sf "lib64trace.so" "codeql/tools/linux64/libtrace.so"
}

package() {
  cd "$srcdir"

  install -Dm644 codeql/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/opt"
  cp -r "codeql" "$pkgdir/opt/$pkgname"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "../../opt/$pkgname/codeql" "$pkgdir/usr/bin/codeql"
}

# vim:set ts=2 sw=2 et:
