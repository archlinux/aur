# Maintainer: OxidizedToast <NicolasTarantino@protonmail.com>
# Reminder on how to make .srcinfo `makepkg --printsrcinfo > .SRCINFO``


pkgname=habit-tracker
pkgver=1.1.0
pkgrel=1
pkgdesc="A TUI habit tracking application written in C++"
arch=('x86_64')
url="https://github.com/OxidizedToast/habit-tracker"
license=('MIT')
depends=()
makedepends=('cmake' 'gcc' 'git')
source=("$pkgname::git+$url.git#tag=v$pkgver-release")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
    cmake --build build --config Release
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 build/habit-tracker "$pkgdir/usr/bin/habit-tracker"

    # Install license if you have one
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
