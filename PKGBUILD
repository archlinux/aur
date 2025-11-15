pkgname=faal
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple application menu because why not"
arch=('x86_64')
url="https://github.com/Polokalap/FAAL"
license=('MIT')
depends=('cmake' 'gcc' 'glibc')
makedepends=('git' 'cmake' 'make')
source=("git+https://github.com/Polokalap/FAAL.git")
sha256sums=('SKIP')
options=('!debug')

build() {
    cd "$srcdir/FAAL"

    cmake -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build build --target FAAL -j$(nproc)
}

package() {
    cd "$srcdir/FAAL"

    install -Dm755 build/FAAL "$pkgdir/usr/bin/faal"
}
