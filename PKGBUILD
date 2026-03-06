# Maintainer: Jarasłaŭ Viktorčyk <ugzuzg@gmail.com>
pkgname=fnm-bin
_pkgname=fnm
pkgver=1.39.0
pkgrel=1
pkgdesc="Fast and simple Node.js version manager, built in Rust"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Schniz/fnm"
license=('GPL3')
provides=('fnm')
conflicts=('fnm-git' 'fnm')
source_x86_64=("$_pkgname-$pkgver-x86_64.zip::$url/releases/download/v$pkgver/$_pkgname-linux.zip")
source_aarch64=("$_pkgname-$pkgver-aarch64.zip::$url/releases/download/v$pkgver/$_pkgname-arm64.zip")
source_armv7h=("$_pkgname-$pkgver-aarch64.zip::$url/releases/download/v$pkgver/$_pkgname-arm32.zip")
sha256sums_x86_64=('7807664f39d39fc518da1c35ba0181e4b3267603c4b1dedeb4b5fc6ae440a224')
sha256sums_aarch64=('4eaff58b2c5bf30d0934027572dd0b5bbb60d2a1af309230b53662d4b1d45599')
sha256sums_armv7h=('4eaff58b2c5bf30d0934027572dd0b5bbb60d2a1af309230b53662d4b1d45599')

package() {
  install -Dm755 fnm "$pkgdir/usr/bin/$_pkgname"

  mkdir -p \
    "$pkgdir"/usr/share/bash-completion/completions \
    "$pkgdir"/usr/share/fish/vendor_completions.d \
    "$pkgdir"/usr/share/zsh/site-functions
  "$pkgdir/usr/bin/$_pkgname" completions --shell bash >"$pkgdir"/usr/share/bash-completion/completions/$_pkgname
  "$pkgdir/usr/bin/$_pkgname" completions --shell fish >"$pkgdir"/usr/share/fish/vendor_completions.d/$_pkgname.fish
  "$pkgdir/usr/bin/$_pkgname" completions --shell zsh >"$pkgdir"/usr/share/zsh/site-functions/_$_pkgname
}
