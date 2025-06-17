#Maintainer:	mumi jim <echo "=02bj5yav9Gb0V3bA1Waq9VatVXb" | rev | base64 -d>

pkgname="hashes"
pkgver=1.1.2
pkgrel=2
pkgdesc='Simple hash algorithm identification GUI using GTK4+Adwaita'
url='https://github.com/zefr0x/hashes'
arch=('aarch64' 'x86_64')
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'python-name-that-hash')
source=("https://github.com/zefr0x/hashes/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('c685a4e857bdfa50fde8b44d9b5d77aef18fa3028f11c31e2068d2970448a4baccd42bd5492ee9b180c9beff2a89efc3f4af5502f9486ab6e635a15273476c51')

build() {
    cd "${pkgname}-${pkgver}"
    arch-meson . build
    meson compile -C build
}

package() {
    cd "${pkgname}-${pkgver}"
    meson install -C build --destdir "$pkgdir"
}
