# Maintainer: Alisa Lain <al1-ce@null.net>

pkgname='confed'
pkgver=1.0.1
pkgrel=1
pkgdesc='Quickly edit configs preset by you'
arch=('i686' 'x86_64')
url='https://github.com/al1-ce/confed'
license=('MIT')
makedepends=('dub' 'ldc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/al1-ce/confed/archive/v$pkgver.tar.gz")
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
