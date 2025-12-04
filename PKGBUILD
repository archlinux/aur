pkgname=libelectron
pkgver=2025.8
pkgrel=1
arch=("x86_64" "aarch64")
url="https://gitlab.com/linuxbombay/libelectron/libelectron"
license=('GPL')
depends=('npm' 'git' 'icu')
pkgdesc="A meta package for electron and electron dependencies."
makedepends=('unzip')
source=("$url/-/archive/$pkgver/libelectron-$pkgver.tar.bz2")
sha256sums=('1b43455353e4d8c6b6c181e9cedae4dee1a496b12b178c3e549921ebd5d6eed1')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    ./setup 
    install -dm755 "$pkgdir/opt/libelectron"
    ln -s "/usr/bin/libelectronmeta" "$pkgdir/opt/libelectron/electron"
    cp -r "$srcdir/$pkgname-$pkgver/node_modules" "$pkgdir/opt/libelectron"
}
