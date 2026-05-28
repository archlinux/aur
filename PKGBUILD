pkgname=langman
pkgver=1.0
pkgrel=1
pkgdesc="Single-binary doc viewer"
arch=('x86_64')
license=('GPL2')
makedepends=('gcc')

source=(main.c LICENSE asm.h c.h cpp.h cs.h css.h d.h el.h go.h hs.h html.h java.h js.h jsonc.h lua.h plist.h py.h r.h rs.h sh.h swift.h toml.h ts.h xml.h yaml.h)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
    cd "$srcdir"
    gcc -O3 main.c -o langman
}

package() {
    cd "$srcdir"
    install -Dm755 langman "$pkgdir/usr/bin/langman"
    install -d "$pkgdir/usr/share/langman"
    install -m644 *.h "$pkgdir/usr/share/langman/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
