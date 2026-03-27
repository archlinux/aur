# Maintainer: k4dy <https://github.com/k4dy>
pkgname=telegramtui
pkgver=1.0.0
pkgrel=1
pkgdesc="Telegram TUI client for the terminal, inspired by lazygit"
arch=('x86_64' 'aarch64')
url="https://github.com/k4dy/telegramtui"
license=('MIT')
depends=('java-runtime>=21' 'telegram-tdlib')
source=("$pkgname-$pkgver.jar::https://github.com/k4dy/telegramtui/releases/download/v$pkgver/$pkgname-$pkgver.jar")
sha256sums=('c1b9febb6a20325d02834bc5c272f4e96432ef3365ae0af82c5eb0962180f29d')

package() {
    install -Dm644 "$pkgname-$pkgver.jar" "$pkgdir/usr/share/$pkgname/$pkgname.jar"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/bash
exec java -jar /usr/share/telegramtui/telegramtui.jar "$@"
EOF
    chmod +x "$pkgdir/usr/bin/$pkgname"
}
