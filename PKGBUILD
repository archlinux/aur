pkgname=eternal-terminal
pkgver=0.1.0
pkgrel=2
pkgdesc="A custom Qt6 terminal emulator"
arch=('x86_64')
url="https://github.com/FourSage747/EternalTerminal"
license=('GPL')

depends=(
    'qt6-base'
    'qt6-declarative'
)

source=("git+https://github.com/FourSage747/EternalTerminal.git")

sha256sums=('SKIP')


build() {
    cmake -B build \
        -S "$srcdir/EternalTerminal" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

package() {
    cmake --install build --prefix "$pkgdir/usr"

    install -d "$pkgdir/usr/bin"

    ln -s EternalTerminalApp "$pkgdir/usr/bin/eternal-terminal"
}
