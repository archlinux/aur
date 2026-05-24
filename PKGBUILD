pkgname=cursorfb
pkgver=1.1.9
pkgrel=1
pkgdesc="Framebuffer software cursor overlay"
arch=('x86_64')
license=('MIT')

depends=()
makedepends=('gcc')

source=("main.c"
        "curfblib.c"
        "curfblib.h"
        "stb_image.h"
        "lwarnlib.c"
        "lwarnlib.h"
        "cursor.png")

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

build() {
    gcc main.c curfblib.c lwarnlib.c \
        -o cursorfb \
        -Wall -Wextra -pthread -lm
}

package() {
    install -Dm755 cursorfb "$pkgdir/usr/bin/cursorfb"

    install -Dm644 cursor.png \
        "$pkgdir/usr/share/cursorfb/cursor.png"
}
