# Maintainer: Alisa Lain <al1-ce@null.net>

pkgname='pkm'
pkgver=1.1.3
pkgrel=1
pkgdesc='A simple wrapper for yay'
arch=('i686' 'x86_64')
url='https://github.com/al1-ce/pkm'
license=('MIT')
depends=('yay')
makedepends=('dub' 'dmd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/al1-ce/pkm/archive/v$pkgver.tar.gz")
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
