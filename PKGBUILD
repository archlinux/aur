
pkgname=notamy
pkgver=0.1.0
pkgrel=1
pkgdesc="Hierarchical note manager for complex technical investigations. (ntm)"
arch=('x86_64')
url="https://github.com/IMprojtech/NotaMy"
license=('GPL3')
depends=()
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/IMprojtech/NotaMy/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "NotaMy-$pkgver"
    make
}

package() {
    cd "NotaMy-$pkgver"

    install -Dm755 bin/ntm "$pkgdir/usr/bin/ntm"

    ln -s ntm "$pkgdir/usr/bin/ntm_nc"
}
