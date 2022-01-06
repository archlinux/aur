# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname=Flatseal
pkgname=flatseal
pkgver=1.7.4
pkgrel=1
pkgdesc='A permissions manager for Flatpak.'
url="https://github.com/tchx84/Flatseal/"
arch=('x86_64')
license=('GPL3')
depends=('flatpak' 'gjs' 'webkit2gtk')
makedepends=('meson' 'flatpak-builder' 'ninja')
source=("$pkgname-$pkgver::https://github.com/tchx84/Flatseal/archive/v$pkgver.tar.gz")
sha1sums=('1e5929a41675043eb87627cd101b166c77b66642')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    meson --prefix /usr --buildtype=plain . build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    DESTDIR="$pkgdir" meson install -C build
}
