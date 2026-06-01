# Maintainer: Crazy <axelvasquez582@gmail.com>
pkgname=gdiff
pkgver=1.0.1
pkgrel=1
pkgdesc="CLI tool to copy git staged diffs along with a set of rules to the clipboard"
arch=('any')
url="https://github.com/0Crazy-0/gdiff"
license=('MIT')
depends=('bash' 'git')
makedepends=('git')
optdepends=(
  'wl-clipboard: for Wayland clipboard support'
  'xclip: for X11 clipboard support'
  'xsel: for X11 clipboard support'
)
source=("gdiff::git+https://github.com/0Crazy-0/gdiff.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd "$srcdir/gdiff"
  
  install -Dm755 bash/gdiff "$pkgdir/usr/bin/gdiff"
  install -Dm644 share/rule.txt "$pkgdir/usr/share/gdiff/rule.txt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
