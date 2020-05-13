# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname=Flatseal
pkgname=flatseal
pkgver=1.5.3
pkgrel=1
pkgdesc='A permissions manager for Flatpak.'
url="https://github.com/tchx84/Flatseal/"
arch=('x86_64')
license=('GPL3')
depends=('flatpak' 'gjs')
makedepends=('meson' 'flatpak-builder' 'ninja')
source=("$pkgname-$pkgver::https://github.com/tchx84/Flatseal/archive/v1.5.3.tar.gz")
sha1sums=('32f29b6cf44262590bebbdb64ad180f3bd6585b4')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    meson --prefix /usr --buildtype=plain . build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    DESTDIR="$pkgdir" meson install -C build
}
