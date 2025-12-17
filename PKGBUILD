pkgname=selector.h-git
pkgver=0.0.1
pkgrel=1
pkgdesc="A library to allow a caller to create a selection ui for the user"
url="https://github.com/euro20179/selector.h"
license=(GPL-3.0)
arch=(x86_64)

build() {
    git clone --recursive https://github.com/euro20179/selector.h.git selector.h.git || {
        cd selector.h.git
        git pull origin master
        cd ..
    }
    cd selector.h.git
    ./mkso
}

package() {
    cd "$srcdir/selector.h.git"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 libselector.so "${pkgdir}/usr/lib/libselector.so"
}
