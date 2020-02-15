# Maintainer: Allonsy < linuxbash8 [at@at] gmail [dot.dot] com >
pkgname=gclone
pkgver=0.6.0
pkgrel=1
pkgdesc="A git-based project helper"
url="https://github.com/allonsy/gclone"
arch=('x86_64')
license=('MIT')
depends=('git')
install=$pkgname.install
source=("$pkgname"::"https://github.com/allonsy/gclone/releases/download/v$pkgver/gclone-bin-linux-v$pkgver"
        "https://github.com/allonsy/gclone/releases/download/v$pkgver/gclone.fish"
        "https://github.com/allonsy/gclone/releases/download/v$pkgver/_gclone"
        "https://raw.githubusercontent.com/allonsy/gclone/master/LICENSE")
sha256sums=('3b03a62ad9c82c84c94695713447736d4b1379d42cb9222111b3d6a08f9b32e4'
            '610dc043b1a44e4037a7f12b3e8667fc95baec4afed4dcf54dfade5822b0016e'
            '37aad94a217fef36960d9e0068cb7075d22e382b8819489c6681433c0a721d40'
            '42b152633a50a3618415203384e4e4e31e3388dffb4fad3fb753019ad31bc73b')
package() {
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/zsh/functions/Completion/Unix
  mkdir -p "$pkgdir"/usr/share/fish/vendor_completions.d
  mkdir -p "$pkgdir"/usr/share/licenses/gclone
  install -m755 gclone "$pkgdir"/usr/bin/gclone-bin
  install -m644 _gclone "$pkgdir"/usr/share/zsh/functions/Completion/Unix
  install -m644 gclone.fish "$pkgdir"/usr/share/fish/vendor_completions.d
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/gclone
}
