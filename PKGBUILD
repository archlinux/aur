# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Fast and syntax-aware semantic code pattern search for many languages: like grep but for code"
arch=(x86_64)
url=https://github.com/returntocorp/semgrep
license=(LGPL2.1)
depends=('bash' 'zlib' 'bzip2' 'ncurses5-compat-libs' 'openssl-1.0')
provides=('semgrep')
options=('!strip')
source=("https://github.com/returntocorp/semgrep/releases/download/v${pkgver}/semgrep-v${pkgver}-ubuntu-16.04.tgz")
sha256sums=('8b9437af0540ed9664904f9603d9d6ad011dad46433cba74e524c7753c7732c9')
# https://github.com/returntocorp/semgrep/releases/download/v${pkgver}/semgrep-v${pkgver}-ubuntu-16.04.tgz.sha256

package() {
  cd "$srcdir"
  find semgrep-files -type f -exec install -D '{}' "$pkgdir/usr/lib/{}" \;
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/lib/semgrep-files/semgrep" "$pkgdir/usr/bin/semgrep"
  ln -s "/usr/lib/semgrep-files/semgrep-core" "$pkgdir/usr/bin/semgrep-core"
}
