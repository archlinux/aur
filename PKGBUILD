pkgname=libelectron
pkgver=2025.6
pkgrel=1
arch=("x86_64" "aarch64")
url="https://gitlab.com/linuxbombay/libelectron/libelectron"
license=('GPL')
depends=('npm' 'libelectron-electron-meta' 'git' 'icu')
depends_x86_64=('electron-castlab-bin')
pkgdesc="A meta package for electron and electron dependencies."
makedepends=('unzip')
source=("$url/-/archive/$pkgver/libelectron-$pkgver.tar.bz2")
sha256sums=('8592e055aa144e6fb37ac7da7ee7d8808f0a7b8a193998bc56a07d91cf8f9efb')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    ./setup 
    install -dm755 "$pkgdir/opt/libelectron"
    ln -s "/usr/bin/libelectronmeta" "$pkgdir/opt/libelectron/electron"
    cp -r "$srcdir/$pkgname-$pkgver/node_modules" "$pkgdir/opt/libelectron"
}
