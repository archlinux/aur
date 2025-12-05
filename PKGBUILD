# Polokalap - Polokalap@autizm.us

pkgname=faal
pkgver=1.0.4.2
pkgrel=1
pkgdesc="Simple application menu because why not"
arch=('x86_64')
url="https://github.com/Polokalap/FAAL"
license=('MIT')
depends=('gtk3' 'gtk-layer-shell' 'glibc' 'gcc-libs' 'glib2')
makedepends=('cmake')
source=("https://github.com/Polokalap/FAAL/archive/refs/tags/v${pkgver}.zip" "https://raw.githubusercontent.com/Polokalap/LICENSE/refs/heads/main/LICENSE")
sha256sums=('e187d4b8165dacc6aa747788eb96553d167341c2cf60a8158dd348a13d2e5e8f' 'd96585293c5ebc2dc94a8eae952be12ff22639924a42e4a0ebda4ae0e779301f')

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
