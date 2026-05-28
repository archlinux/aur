pkgname=libelectron
pkgver=2026.3
pkgrel=1
arch=("x86_64" "aarch64")
url="https://gitlab.com/linuxbombay/libelectron/libelectron"
license=('GPL')
depends=('npm' 'git' 'icu')
pkgdesc="A meta package for electron and electron dependencies."
makedepends=('unzip')
source=("$url/-/archive/$pkgver/libelectron-$pkgver.tar.bz2")
sha256sums=('3e36271bbe634b5755d2fff39ac7b2f184bcb73f8e31a4b8b9b84854e79337b1')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    npm install --legacy-peer-deps --omit=dev
    install -dm755 "$pkgdir/opt/libelectron"
    ln -s "/usr/bin/libelectronmeta" "$pkgdir/opt/libelectron/electron"
    cp -r "$srcdir/$pkgname-$pkgver/node_modules" "$pkgdir/opt/libelectron"
}
