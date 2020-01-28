# Maintainer: George Rawlinson <george@rawlinson.net.nz>
pkgname=efi-roller-git
pkgver=0.1.r10.04cefd6
pkgrel=1
pkgdesc="simple script to help sign EFI images"
arch=(any)
url="https://github.com/Foxboron/efi-roller"
license=(MIT)
depends=(efitools openssl sbsigntools util-linux)
makedepends=(git asciidoc)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Foxboron/efi-roller.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make PREFIX=usr DESTDIR="$pkgdir/" install
}
