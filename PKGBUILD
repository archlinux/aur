# Maintainer: Victor Vintorez <victor@vintorez.dev>

pkgname=szablon-git
pkgver=0.1.0.r3.gdcd079b
pkgrel=1
makedepends=('rust' 'cargo' 'git')
provides=('szablon')
conflicts=('szablon')
arch=('x86_64')
pkgdesc="A work-in-progress editorconfig inspired cross-editor standard for file templates"
license=('EUPL')
source=('git+https://git.poz.pet/poz/szablon')
url='https://git.poz.pet/poz/szablon'
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/szablon"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/szablon"
    cargo build --release --locked
}

package() {
    install -Dm 755 "$srcdir/szablon/target/release/szablon" "$pkgdir/usr/bin/szablon"
}
