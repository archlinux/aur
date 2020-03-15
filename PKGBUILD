# Maintainer: PolyMeilex <bartek.marynczak@op.pl>
pkgname="yetanotherbar-git"
pkgver=0.0.1.r0.g80feb5e
pkgrel=1
pkgdesc="YetAnotherBar is simple gtk based statusbar for i3 with support for CSS"
arch=('i686' 'x86_64')
url="https://github.com/PolyMeilex/YetAnotherBar.git"
license=('GPL3')
depends=()
makedepends=('git' 'rust')
source=("yetanotherbar::git+https://github.com/PolyMeilex/YetAnotherBar.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/yetanotherbar"
    git describe --long --tags | sed "s/-/.r/;s/-/./g"
}

build() {
    cd "$srcdir/yetanotherbar"
    cargo build --release --locked
}

package() {
    cd "$srcdir/yetanotherbar"
    install -Dm 755 target/release/yetanotherbar -t "${pkgdir}/usr/bin"
}
