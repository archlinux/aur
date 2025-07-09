pkgname=libelectron
pkgver=2025.5
pkgrel=5
arch=("x86_64" "aarch64")
url="https://gitlab.com/linuxbombay/libelectron/libelectron"
license=('GPL')
depends=('npm' 'libelectron-electron-meta' 'git' 'icu')
pkgdesc="A meta package for electron and electron dependencies."
makedepends=('unzip')
source=("$url/-/archive/$pkgver/libelectron-$pkgver.tar.bz2")
sha256sums=('ffaadb9ae66d8f79041111012522cdf997265e5d8bec8071d7ce7212afc6662e')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    ./setup 
    install -dm755 "$pkgdir/opt/libelectron"
    ln -s "/usr/bin/libelectronmeta" "$pkgdir/opt/libelectron/electron"
    cp -r "$srcdir/$pkgname-$pkgver/node_modules" "$pkgdir/opt/libelectron"
}
