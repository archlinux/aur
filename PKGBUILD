# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=dagtoc-bin
_pkgname="${pkgname%-bin}"
pkgver=5.1.0
pkgrel=1
pkgdesc="A CLI tool for operating pdf contents"
arch=('x86_64')
url="https://github.com/TD-Sky/dagtoc"
license=('GPL3')
provides=("$pkgname")
conflicts=("$_pkgname")
depends=('fontconfig')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$arch-unknown-linux-gnu.tar.gz")
sha256sums=('bb8fe1deaecea76da85aecfb1cbb8169eeb70446faba05a6f3fd993ca21522bc')

package() {
  install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 "completions/$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 "completions/_$_pkgname" -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm 644 "completions/$_pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm 644 "completions/$_pkgname.nu" -t "$pkgdir/usr/share/nushell/completions"

  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
