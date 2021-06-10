# Maintainer: Emanuele Faranda <black.silver@hotmail.it>
pkgname=ai-bot-workspace-bin
pkgver=2.4.3
pkgrel=1
pkgdesc="An Electron application which includes testing workspaces for most Riddles.io competitions"
arch=('x86_64')
url="https://github.com/jmerle/ai-bot-workspace"
license=('MIT')
groups=()
depends=('jre8-openjdk')
makedepends=()
options=(!strip)
source=(
  'https://github.com/jmerle/ai-bot-workspace/releases/download/v'$pkgver'/ai-bot-workspace-'$pkgver'-x86_64.AppImage'
  'ai_bot_workspace.tar.gz'
)
sha256sums=(
  '15f8dcbc6f729cfb421a342f809b53cfac0f816ac298e5ed5a14a4424a2196de'
  '933f70e73eb8d7eb57d394d43fc712299004bbb815fbe4e4d5548ebbc8f13d5a'
)
conflicts=()

package() {
  cd "$srcdir/"

  # Creating needed directories
  install -dm755 "$pkgdir/usr/bin"

  # Install main program
  install -Dm755 "$srcdir/ai-bot-workspace-$pkgver-x86_64.AppImage" "$pkgdir/usr/bin/ai-bot-workspace"

  # Install icons and desktop launcher
  tar -xf ai_bot_workspace.tar.gz
  cp -r usr/* "$pkgdir/usr"
}
