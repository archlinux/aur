# Maintainer: Hüseyn Teymurzade <https://github.com/Huseynteymurzade28>

pkgname=pomtex-bin
_pkgname=pomtex
pkgver=0.1.0
pkgrel=1
pkgdesc="On-demand LaTeX: a portable TeX kernel that installs CTAN packages only when a document needs them (static binary)"
arch=('x86_64')
url="https://github.com/Huseynteymurzade28/pomtex"
license=('MIT')
depends=('xz')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
options=('!debug')
sha256sums=('8790a39e397fe2a57103ecfb46d99c33c142f9fd59578e42f5b8816329af87e4')

package() {
  cd "$_pkgname-$pkgver-linux-x86_64"
  install -Dm755 pomtex "$pkgdir/usr/bin/pomtex"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
