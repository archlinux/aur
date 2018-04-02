# Maintainer: Scias < shining -dot- scias \at\ gmail #dot# com>
pkgname=msi-rgb
pkgver=0.1.0
pkgrel=1
pkgdesc="Utility for controlling the RGB LEDs on MSI motherboards"
arch=('i686' 'x86_64')
url="https://github.com/nagisa/msi-rgb"
license=('ISC')
makedepends=('rust')
source=("$pkgname"::'git+https://github.com/nagisa/msi-rgb')
md5sums=('SKIP')

build() {
        cd "$pkgname"
        cargo build --release
}

package() {
        mkdir -p "$pkgdir/usr/bin"
        cp "$pkgname/target/release/msi-rgb" "$pkgdir/usr/bin"
}
