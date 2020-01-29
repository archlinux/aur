# Maintainer: Carson Black <uhhadd AT gmail DOT com>
pkgname=alpmbuild
pkgver=0.1
pkgrel=1
pkgdesc="Build Arch packages using the specfile format used by rpmbuild and debbuild"
arch=(any)

url="https://github.com/Appadeia/alpmbuild"
license=("GPL")

depends=(
    "rpm"
)
makedepends=(
    "go"
)

source=("alpmbuild-0.1.tar.gz::https://github.com/Appadeia/alpmbuild/archive/0.1.tar.gz")
md5sums=("50e0cf5d20af51e7d1ef79f32c42bfb9")

build() {
    cd "$pkgname-$pkgver"
    go build
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 alpmbuild "$pkgdir/usr/bin/alpmbuild"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}