# Maintainer: Vitaly Lipatov <lav@etersoft.ru>

pkgname=eepm
pkgver=3.64.13
pkgrel=1
pkgdesc="A package manager with universal interface for any platform"
arch=('any')
url="https://github.com/Etersoft/eepm/"
license=('AGPL3')
depends=(coreutils findutils diffutils file gawk grep gzip less sed bash ncurses)
makedepends=('make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Etersoft/eepm/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('52fa38cd491b47209cfe41df8cf056d03b601626dc5e948a2865fbb2e310c1db')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR=$pkgdir datadir=/usr/share bindir=/usr/bin mandir=/usr/share/man sysconfdir=/etc version=${pkgver}-${pkgrel}
}
