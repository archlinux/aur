# Maintainer: Eduard Tanase <eduard dot tanase1 at gmail dot com>
# Contributor: Sauyon Lee <me at sjl dot re>
pkgname=codeql
pkgver=2.13.5
pkgrel=1
epoch=
pkgdesc="The CLI tool for GitHub's CodeQL"
arch=('i686' 'x86_64')
url="https://github.com/github/codeql-cli-binaries"
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
options=(!strip)
install=
changelog=
source=("$pkgname-v$pkgver.zip::https://github.com/github/codeql-cli-binaries/releases/download/v$pkgver/codeql-linux64.zip")
sha256sums=('1c403df7e61d9d2ae063e485993703e9b803473f823c238780bffa4d503ae76a')

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
