# Maintainer: Tyler Ristimaki <tpristimaki@gmail.com>

pkgname=ebus-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="An event bus that allows for inter-process communication by emitting and polling events on channels (pre-built binaries)"
arch=('x86_64')
url="https://github.com/Tylo-6/ebus"
license=('GPL-3.0')
depends=('glibc')
source=("https://github.com/Tylo-6/eBus/releases/download/v$pkgver-release/ebus-v$pkgver-release-x86_64.tar.gz")
sha256sums=('SKIP')
options=('!debug')

package() {
    cd "$srcdir/ebus-v$pkgver-release-x86_64"

    install -Dm755 "memory.so" "$pkgdir/usr/lib/memory.so"
    install -Dm755 "listener.so" "$pkgdir/usr/lib/listener.so"
    install -Dm755 "emitter.so" "$pkgdir/usr/lib/emitter.so"
    
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
