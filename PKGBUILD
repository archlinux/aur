# Maintainer: kuro <kuro@kuro.moe>
# Contributor: kuro <kuro@kuro.moe>

pkgname=ender-dots
pkgver=2026.05.19
pkgrel=1
pkgdesc="AI-first Arch Linux ecosystem — KDE dotfiles, Neovim, OpenCode, Fish, Starship, Vicinae, custom Japanese OCR/study scripts, and automated workflows"
arch=('any')
url="https://github.com/kurojs/EnderDots"
license=('MIT')
depends=(
  'fish'
  'starship'
  'neovim'
  'git'
  'curl'
  'jq'
)
optdepends=(
  'opencode: AI-first IDE config'
  'zed: Zed editor config'
  'ghostty: Ghostty terminal config'
  'warp-terminal: Warp terminal config'
  'vicinae: Application launcher config'
  'kwin: KDE window rules and tiling'
  'python: For custom scripts (OCR, Spotify, etc.)'
  'manga-ocr: Japanese OCR scripts'
  'ffmpeg: Audio playback for TTS scripts'
)
source=("master.tar.gz::https://github.com/kurojs/EnderDots/archive/master.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/EnderDots-master"

  install -dm755 "$pkgdir/usr/share/$pkgname"

  cp -r .config "$pkgdir/usr/share/$pkgname/"
  cp -r .local "$pkgdir/usr/share/$pkgname/"
  cp -r .gemini "$pkgdir/usr/share/$pkgname/"
  cp -r .zen "$pkgdir/usr/share/$pkgname/"
  cp -r home "$pkgdir/usr/share/$pkgname/"
  cp -r usr "$pkgdir/usr/share/$pkgname/"
  cp -r Docs "$pkgdir/usr/share/$pkgname/"

  install -Dm644 README.md "$pkgdir/usr/share/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/$pkgname/LICENSE"
}
