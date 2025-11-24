# Maintainer: Frank Endres <first@last.fr>

pkgname=geany-ai-chat
pkgver=1.1.1
pkgrel=1
pkgdesc="Geany plugin for AI-powered chat functionality. The plugin allows users to interact with an AI chatbot using emojis and text input"
arch=('any') # Ajuster si nécessaire pour d'autres architectures
url="https://github.com/n-engine/geany-ai-chat"
license=('MIT')
depends=('geany' 'gtksourceview3')
makedepends=() # make est dans base-devel, donc pas besoin de le déclarer ici
source=("https://github.com/n-engine/geany-ai-chat/archive/v${pkgver}.tar.gz")
sha256sums=('c37ecf99916eb9dff90f22f6d1110bc4053e96bd2e5fc55c2abc43ba07c2a824')

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
