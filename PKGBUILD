# Maintainer: Jake Stanger <mail@jstanger.dev>

pkgname=ironbar-git
pkgver=v0.11.0.r0.6836abe
pkgrel=1
makedepends=('rust' 'cargo')
depends=('gtk3' 'gtk-layer-shell')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Customisable wlroots/sway bar written in rust"
license=('MIT')
source=('git+https://github.com/JakeStanger/ironbar')
md5sums=('SKIP')


pkgver() {
    cd "$srcdir/ironbar"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/ironbar"
    cargo build --release --locked
}

package() {
  install -Dm 755 "$srcdir/ironbar/target/release/ironbar" "$pkgdir/usr/bin/ironbar"
}
