# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Toria <ninetailedtori@uwu.gal>
# Maintainer: Martin Bogdanov <aur@martinbogdanov.com>
# Maintainer: javalsai <javalsai@proton.me>

pkgname=lidm
pkgver=2.0.0
pkgrel=1
depends=('pam' 'lidm-service')
makedepends=()
pkgdesc="A fully colorful customizable TUI display manager made in C. (build latest tag)"
arch=('any')
url="https://github.com/javalsai/lidm"
license=('GPL-3.0-only')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/javalsai/lidm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('94315160a9a7d5c45cdb26ad8e9ddecb5a0d52959286a197ff2a9c07f9c248e1')

build() {
    make -C "$srcdir/lidm-$pkgver"
}

package() {
    make -C "$srcdir/lidm-$pkgver" DESTDIR="$pkgdir" PREFIX="/usr" install
}
