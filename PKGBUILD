# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=9paste
pkgver=0.1.6
pkgrel=1
pkgdesc="Clipboard transformer that automatically cleans, formats, and transforms clipboard text"
arch=('x86_64')
url="https://github.com/skorotkiewicz/9paste"
license=('MIT')
depends=('glibc' 'gcc-libs' 'dbus')
conflicts=('9paste')
provides=('9paste')
options=(!strip)
source_x86_64=("9paste-${pkgver}-linux-x86_64.tar.gz::https://github.com/skorotkiewicz/9paste/releases/download/${pkgver}/9paste-linux-x86_64.tar.gz")
sha256sums_x86_64=('09cc3086ce7cc6db5b63b6de4107dd27c7c309e970059c12318e802a2b20f88c')

package() {
    cd "$srcdir"
    install -Dm755 "9paste" "$pkgdir/usr/bin/9paste"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    if [[ -f "LICENSE" ]]; then
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
