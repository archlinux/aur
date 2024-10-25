# Maintainer: Nakidai <nakidai at disroot dot org>
pkgname=througha
pkgdesc="Run commands through a proxy"
url="https://github.com/nakidai/througha"
license=("0BSD")

pkgver=1.0.2
pkgrel=1

arch=("x86_64")
depends=("glibc")
makedepends=("gcc")

source=("$pkgname-$pkgver::https://github.com/nakidai/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4ed5f38c4c258d2640fc5274f3b05f3b8b5ddbe693b6b87bb912b8dc251496f8')

build() {
    cd "$pkgname-$pkgver"
    make clean all
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
