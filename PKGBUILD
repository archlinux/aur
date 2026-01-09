# Maintainer: Matthew Phillips <matthew@matthewphillips.info>
pkgname=chop
pkgver=0.5.24
pkgrel=1
pkgdesc="Unix-philosophy CLI todo manager"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/mphillips/chop"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/mphillips/chop/archive/v$pkgver.tar.gz")
sha256sums=('9e98d645f6480efbf07bc5d9c0ba240fb4fcde8f05dd0673999f32281ba737e7')

build() {
    cd "$pkgname"
    make VERSION=$pkgver
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
