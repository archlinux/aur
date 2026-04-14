pkgname=prism-tui-bin
_pkgname=prism-tui
pkgver=0.3.0
pkgrel=1
pkgdesc="Terminal user interface for PrismLauncher"
arch=('x86_64')
url="https://github.com/OneNoted/Prism-TUI"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "${_pkgname}-git")
source=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
  "LICENSE::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums=(
  'f1e47b2eefc4dc1cf13f2bf7fcd92dbf3d6d3fa95652b63143704f434b9e3d14'
  'b65db193e1889c2fc3529ddacbc78678a56394c1873804ae38267885da984b16'
)

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
