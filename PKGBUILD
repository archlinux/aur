# Maintainer: Vitaly Lipatov <lav@etersoft.ru>

pkgname=eepm
pkgver=3.64.73
pkgrel=1
pkgdesc="A package manager with universal interface for any platform"
arch=('any')
url="https://github.com/Etersoft/eepm/"
license=('AGPL3')
depends=(coreutils findutils diffutils file gawk grep gzip less sed bash ncurses)
makedepends=('make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Etersoft/eepm/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1b3cd92a6e0b41bb99140884290d92eb0c7eef3c35e59732f7c31adebe9ff0cc')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR=$pkgdir datadir=/usr/share bindir=/usr/bin mandir=/usr/share/man sysconfdir=/etc version=${pkgver}-${pkgrel}
}
