pkgname=minisystool
pkgver=1.0
pkgrel=1
pkgdesc="MiniSysTool – simple GTK tool"
arch=('x86_64')
url="https://github.com/sidegemninja/minisystool.git"
license=('custom')
depends=('gtk3')
makedepends=('git' 'gcc' 'pkgconf')
source=("$pkgname::git+https://codeberg.org/sidegemninja/minisystool.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    chmod +x build.sh
    ./build.sh
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 minisystool "$pkgdir/usr/bin/minisystool"
}

