# Maintainer: Alisa Lain <al1-ce@null.net>

pkgname='backpack'
pkgver=1.0.0
pkgrel=1
pkgdesc='Git based backup tool'
arch=('i686' 'x86_64')
url='https://github.com/al1-ce/backpack'
license=('MIT')
makedepends=('dub' 'dmd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/al1-ce/backpack/archive/v$pkgver.tar.gz")
md5sums=('SKIP')
validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    dub build -b release -c default
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
}
