# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=iwant-bin
_pkgname=iwant
pkgver=0.5.1
pkgrel=1
pkgdesc="Install applications what I WANT"
arch=('x86_64')
url="https://github.com/TD-Sky/iwant"
license=('MIT')
conflicts=('iwant')
optdepends=('paru: AUR support'
            'flatpak: flathub support'
            'npm: npm support')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$arch-unknown-linux-gnu.tar.gz")
sha256sums=('1102d70ffce2467ae55c6a2f5cf6fd2ae4741b2698311a7f93d3d080f0a50939')

package() {
  install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 "completions/$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 "completions/_$_pkgname" -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm 644 "completions/$_pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm 644 "completions/$_pkgname.nu" -t "$pkgdir/usr/share/nushell/completions"

  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
