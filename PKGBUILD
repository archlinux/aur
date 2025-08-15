pkgname=arch_update_cli_tool
pkgver=0.5.1
pkgrel=1
pkgdesc="A C CLI tool to check updates on installed packages and log them"
arch=('x86_64')
url="https://github.com/LewiFZZ/arch_update_cli_tool"
license=('MIT')
depends=('curl')
makedepends=('make' 'gcc')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/${pkgname//-/_}-$pkgver"
    make clean
    make
}

package() {
    cd "$srcdir/${pkgname//-/_}-$pkgver"
    install -Dm755 build/arch-update-checker "$pkgdir/usr/bin/arch-update-checker"
}
