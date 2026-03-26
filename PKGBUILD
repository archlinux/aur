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
sha256sums=('3ab42ad0df6f153a996c7521adc317ce1de39d478e822db0dfd16384e62239d9')

package() {
    install -Dm644 "$pkgname-$pkgver.jar" "$pkgdir/usr/share/$pkgname/$pkgname.jar"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/bash
exec java -jar /usr/share/telegramtui/telegramtui.jar "$@"
EOF
    chmod +x "$pkgdir/usr/bin/$pkgname"
}
