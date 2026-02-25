# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Toria <ninetailedtori@uwu.gal>
# Maintainer: Martin Bogdanov <aur@martinbogdanov.com>
# Maintainer: javalsai <javalsai@proton.me>

pkgname=lidm
pkgver=2.0.2
pkgrel=1
depends=('pam' 'lidm-service')
makedepends=()
pkgdesc="A fully colorful customizable TUI display manager made in C. (build latest tag)"
arch=('any')
url="https://github.com/javalsai/lidm"
license=('GPL-3.0-only')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/javalsai/lidm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('08bb013df15987b5a685c5925a41b2c9a8531e4af3c9a097c0dbb1fa8a6d8a79')

build() {
    make -C "$srcdir/lidm-$pkgver"
}

package() {
    make -C "$srcdir/lidm-$pkgver" DESTDIR="$pkgdir" PREFIX="/usr" install
}
