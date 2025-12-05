# Polokalap - Polokalap@autizm.us

pkgname=faal
pkgver=1.0.4.3
pkgrel=1
pkgdesc="Simple application menu because why not"
arch=('x86_64')
url="https://github.com/Polokalap/FAAL"
license=('MIT')
depends=('gtk3' 'gtk-layer-shell' 'glibc' 'gcc-libs' 'glib2')
makedepends=('cmake')
source=("https://github.com/Polokalap/FAAL/archive/refs/tags/v${pkgver}.zip" "https://raw.githubusercontent.com/Polokalap/LICENSE/refs/heads/main/LICENSE")
sha256sums=('ff3a2e7d31432e41c188d0cd09f26b31fc153fbef277b940b2290b78770e4b74' 'd96585293c5ebc2dc94a8eae952be12ff22639924a42e4a0ebda4ae0e779301f')

build() {

    cd "$srcdir"/FAAL-*

    cmake -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build build

}

package() {

    cd "$srcdir"/FAAL-*

    install -Dm755 build/FAAL "$pkgdir/usr/bin/faal"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
