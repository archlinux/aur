# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname=Flatseal
pkgname=flatseal
pkgver=1.8.1
pkgrel=1
pkgdesc='A permissions manager for Flatpak.'
url="https://github.com/tchx84/Flatseal/"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('flatpak' 'gjs' 'webkit2gtk' 'libhandy')
makedepends=('meson' 'flatpak-builder' 'ninja')
source=("$pkgname-$pkgver::https://github.com/tchx84/Flatseal/archive/v$pkgver.tar.gz")
sha1sums=('ff4be58373b1f71a21583338f104a9cc31d57ee5')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    meson --prefix /usr --buildtype=plain . build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    DESTDIR="$pkgdir" meson install -C build
}
