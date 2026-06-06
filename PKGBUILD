# Maintainer: JuanPerdomo00 <jakepys>

pkgname=openmanagerc
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple OpenRC service manager GUI built with Odin and Raylib"
arch=('x86_64')
url="https://github.com/JuanPerdomo00/openmanagerc"
license=('GPL3')
depends=('raylib')
makedepends=('odin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JuanPerdomo00/openmanagerc/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/openmanagerc-main"
    odin build . -out:"$pkgname" -extra-linker-flags:"-lraylib -lm"
}

package() {
    cd "$srcdir/openmanagerc-main"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
