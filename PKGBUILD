pkgname=fsysutils
pkgver=1.0
pkgrel=1
pkgdesc="Falcon system utilities"
arch=('x86_64')
url="https://github.com/HanSolo1000Falcon/falcon-system-utils"
license=('MIT')
depends=()
makedepends=('cmake' 'gcc' 'git')

source=("fsysutils::git+https://github.com/HanSolo1000Falcon/falcon-system-utils.git")

sha256sums=('SKIP')

build() {
    cd "$srcdir/fsysutils"
    cmake -B build -S .
    cmake --build build
}

package() {
    install -Dm755 "$srcdir/fsysutils/build/fsysutils" "$pkgdir/usr/bin/fsysutils"
}
