# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=crier
pkgver=0.2.1
pkgrel=1
pkgdesc="Simple push notification tool - works on LAN (TCP) or across the internet (MQTT)"
arch=('x86_64')
url="https://github.com/skorotkiewicz/crier"
license=('MIT')
depends=('glibc')
options=(!strip)
source_x86_64=("crier-${pkgver}-linux-x86_64.tar.gz::https://github.com/skorotkiewicz/crier/releases/download/${pkgver}/crier-linux-x86_64.tar.gz")
sha256sums_x86_64=('SKIP')

package() {
    cd "$srcdir"
    install -Dm755 "crier" "$pkgdir/usr/bin/crier"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    if [[ -f "LICENSE" ]]; then
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
