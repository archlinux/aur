# Former Maintainer: Eduard Tanase <eduard dot tanase1 at gmail dot com>
# Current Maintainer: froub (https://aur.archlinux.org/account/froub)
# Contributor: Sauyon Lee <me at sjl dot re>


pkgname=codeql
pkgver=2.23.2
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
sha256sums=('df3fd812cbaea14262da63dec4220a10163febdabc5472676339861a2aac0d4f')

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
