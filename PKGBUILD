# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=dagtoc-bin
_pkgname="${pkgname%-bin}"
pkgver=5.0.1
pkgrel=1
pkgdesc="A CLI tool for operating pdf contents"
arch=('x86_64')
url="https://github.com/TD-Sky/dagtoc"
license=('GPL3')
provides=("$pkgname")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$arch-unknown-linux-gnu.tar.gz")
sha256sums=('730ea80df1be618b006bcc9c7476f934102b43aac70e65b678fbd8242be81479')

package() {
  install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 "completions/$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 "completions/_$_pkgname" -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm 644 "completions/$_pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm 644 "completions/$_pkgname.nu" -t "$pkgdir/usr/share/nushell/completions"

  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
