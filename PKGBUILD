# Maintainer: Alisa Lain <al1-ce@null.net>

pkgname='pxv'
pkgver=2.1.3
pkgrel=1
pkgdesc='Instant feature rich terminal image viewer'
arch=('i686' 'x86_64')
url='https://github.com/al1-ce/pxv'
license=('MIT')
makedepends=('dub' 'dmd')
depends=('gcc-libs' 'glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/al1-ce/pxv/archive/v$pkgver.tar.gz")
md5sums=('SKIP')
validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    dub build -b release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
