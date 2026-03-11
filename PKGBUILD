# Maintainer: goshitsarch <goshitsarch@aur>
pkgname=goshapps-notepad
pkgver=1.0.0
pkgrel=1
pkgdesc='A Windows 98 Notepad clone built with GTK4 and libadwaita'
arch=('x86_64')
url='https://github.com/goshitsarch-eng/Goshapps-Notepad'
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('meson' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "Goshapps-Notepad-$pkgver"
    meson setup build --prefix=/usr
    ninja -C build
}

package() {
    cd "Goshapps-Notepad-$pkgver"
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
