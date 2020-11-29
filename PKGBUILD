# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname=Flatseal
pkgname=flatseal
pkgver=1.6.5
pkgrel=1
pkgdesc='A permissions manager for Flatpak.'
url="https://github.com/tchx84/Flatseal/"
arch=('x86_64')
license=('GPL3')
depends=('flatpak' 'gjs')
makedepends=('meson' 'flatpak-builder' 'ninja')
source=("$pkgname-$pkgver::https://github.com/tchx84/Flatseal/archive/v$pkgver.tar.gz")
sha1sums=('e629b34b0430d1c9f307b30a47d082fec29c1281')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    meson --prefix /usr --buildtype=plain . build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    DESTDIR="$pkgdir" meson install -C build
}
