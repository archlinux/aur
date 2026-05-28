pkgname=langman
pkgver=1.0
pkgrel=1
pkgdesc="Single-binary doc viewer"
arch=('x86_64')
license=('GPL2')
makedepends=('gcc')

build() {
    gcc -v -O3 main.c -o langman
}

package() {
    if [ ! -f "langman" ]; then
        echo "Error: Binary 'langman' not found after build!"
        exit 1
    fi
    install -Dm755 langman "$pkgdir/usr/bin/langman"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
