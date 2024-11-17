# Maintainer: Jarasłaŭ Viktorčyk <ugzuzg@gmail.com>
pkgname=fnm-bin
_pkgname=fnm
pkgver=1.38.1
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
sha256sums_x86_64=('b69e5c9a05c1e17e4a7de9a17df14ba430d049f2591af791a6f850a170296069')
sha256sums_aarch64=('69feda9455931c26c84be9f95f5e6f69e8b64686e68069fab7cfc34756cd2944')
sha256sums_armv7h=('69feda9455931c26c84be9f95f5e6f69e8b64686e68069fab7cfc34756cd2944')

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
