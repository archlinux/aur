# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=conceal-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Command line recycle bin"
arch=('x86_64')
url="https://github.com/TD-Sky/conceal"
license=('MIT')
provides=("$pkgname")
conflicts=("${pkgname%-bin}")
depends=('fzf')
optdepends=('skim: supports skim as finder')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$arch-unknown-linux-gnu.tar.gz")
sha256sums=('697ff316cafcb15e08d2d218f0ad60424a7adf8479d84a6fd38addc942c0fd93')

package() {
  install -Dm 755 conceal -t "$pkgdir/usr/bin"
  install -Dm 644 "completions/conceal/_conceal" -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm 644 "completions/conceal/conceal.bash" "$pkgdir/usr/share/bash-completion/completions/conceal"
  install -Dm 644 "completions/conceal/conceal.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm 644 "completions/conceal/conceal.nu" -t "$pkgdir/usr/share/nushell/completions"

  install -Dm 755 cnc -t "$pkgdir/usr/bin"
  install -Dm 644 "completions/cnc/_cnc" -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm 644 "completions/cnc/cnc.bash" "$pkgdir/usr/share/bash-completion/completions/cnc"
  install -Dm 644 "completions/cnc/cnc.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm 644 "completions/cnc/cnc.nu" -t "$pkgdir/usr/share/nushell/completions"

  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
}
