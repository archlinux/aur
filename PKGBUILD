# Maintainer: Ben Goldberg <benaaron.dev>

pkgname=stargazer-gmi
pkgver=0.3.0
pkgrel=1
pkgdesc="stargzer gemini server"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~zethra/stargazer/"
license=('AGPL-3.0')
source=("https://git.sr.ht/~zethra/stargazer/archive/$pkgver.tar.gz")
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'scdoc' 'binutils')
sha256sums=("ca53fd8220729cd37be969f47aad6fe0b27eca3cc89957639db78d9e4621ca52")

build() {
    tar -xf $pkgver.tar.gz
    cd "$srcdir/stargazer-$pkgver"
    ./scripts/build
}

check() {
    cd "$srcdir/stargazer-$pkgver"
    ./scripts/test
}

package() {
    cd "$srcdir/stargazer-$pkgver"
    source ./scripts/install --prefix="$pkgdir/usr" --sysconfdir="$pkgdir/etc"
}
