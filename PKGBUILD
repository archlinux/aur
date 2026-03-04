pkgname=libelectron
pkgver=2026.2
pkgrel=1
arch=("x86_64" "aarch64")
url="https://gitlab.com/linuxbombay/libelectron/libelectron"
license=('GPL')
depends=('npm' 'git' 'icu')
pkgdesc="A meta package for electron and electron dependencies."
makedepends=('unzip')
source=("$url/-/archive/$pkgver/libelectron-$pkgver.tar.bz2")
sha256sums=('e1fa9457805fc5a6583f9676e3dcc71e52ea85440b44bef1267fde6b069e1531')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    npm install --legacy-peer-deps --omit=dev
    install -dm755 "$pkgdir/opt/libelectron"
    ln -s "/usr/bin/libelectronmeta" "$pkgdir/opt/libelectron/electron"
    cp -r "$srcdir/$pkgname-$pkgver/node_modules" "$pkgdir/opt/libelectron"
}
