# Maintainer: Frank Endres <first@last.fr>

pkgname=geany-ai-chat
pkgver=1.2.0
pkgrel=1
pkgdesc="Geany plugin for AI-powered chat functionality. The plugin allows users to interact with an AI chatbot using emojis and text input."
arch=('any')
url="https://github.com/n-engine/geany-ai-chat"
license=('MIT')
depends=('geany' 'gtksourceview3')
makedepends=()
source=("https://github.com/n-engine/geany-ai-chat/archive/v${pkgver}.tar.gz")
sha256sums=('07a5c846eb5e1f0ddf5c766f0de0ea29eb388d117fdee49a42b116fedfca4a06')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 ai_chat.so "$pkgdir/usr/lib/geany/ai-chat.so"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
