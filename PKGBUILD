pkgname=i3-bind
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI/TUI utility to manage i3 window manager keybindings"
arch=('x86_64')
url="https://github.com/Hanashiko/i3-bind"
license=('MIT')
depends=('fzf')
makedepends=('go')
source=("main.go" "go.mod" "go.sum")
sha256sums=('d60de99a5563180626d1efd8c40af57752870c8dd023a03026c769b1ff1c4e53' '39b3c1658b5db83570aa40f1e1e3124e0ddfb67d1704d37258b196c10f8d7ccb' 'd6170414b5b3210fba21b570972174eddbb0acedb1e3a980042f827cb79923ab')

build() {
    cd "$srcdir"
    go build -o i3-bind main.go
}

package() {
    install -Dm755 "$srcdir/i3-bind" "$pkgdir/usr/bin/i3-bind"
}
