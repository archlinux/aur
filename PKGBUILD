# Maintainer: Alisa Lain <al1-ce@null.net>

pkgname='luneta'
pkgver=0.7.4
pkgrel=1
pkgdesc='Interactive command-line filter that can be applied to any list, e.g., "ls | luneta"'
arch=('i686' 'x86_64')
url='https://github.com/fbeline/luneta'
license=('GPL')
depends=('ncurses')
makedepends=('dub' 'dmd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fbeline/luneta/archive/v$pkgver.tar.gz")
md5sums=('SKIP')
validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    dub build -b release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
