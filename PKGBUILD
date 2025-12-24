# Maintainer: Matthew Phillips <matthew@matthewphillips.info>
pkgname=chop
pkgver=0.5.18
pkgrel=1
pkgdesc="Unix-philosophy CLI todo manager"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/mphillips/chop"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/mphillips/chop/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
