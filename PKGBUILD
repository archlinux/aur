# Maintainer: Hüseyn Teymurzade <https://github.com/Huseynteymurzade28>

pkgname=pomtex-bin
_pkgname=pomtex
pkgver=0.3.1
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
sha256sums=('17164430b4c439f05f30d6aa779b201a25fd66846b7ffc00dbf27ea89fe0c69b')

package() {
  cd "$_pkgname-$pkgver-linux-x86_64"
  install -Dm755 pomtex "$pkgdir/usr/bin/pomtex"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 share/pomtex.bash "$pkgdir/usr/share/bash-completion/completions/pomtex"
  install -Dm644 share/pomtex.fish "$pkgdir/usr/share/fish/vendor_completions.d/pomtex.fish"
  install -Dm644 share/pomtex.zsh "$pkgdir/usr/share/zsh/site-functions/_pomtex"
  install -Dm644 share/pomtex.1 "$pkgdir/usr/share/man/man1/pomtex.1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
