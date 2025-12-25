# Maintainer: Vitaly Lipatov <lav@etersoft.ru>

pkgname=eepm
pkgver=3.64.47
pkgrel=1
pkgdesc="A package manager with universal interface for any platform"
arch=('any')
url="https://github.com/Etersoft/eepm/"
license=('AGPL3')
depends=(coreutils findutils diffutils file gawk grep gzip less sed bash ncurses)
makedepends=('make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Etersoft/eepm/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('af2d5976c866c06c63e54c49192b97971275da79b7b3261a30e85c615b0cf74a')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR=$pkgdir datadir=/usr/share bindir=/usr/bin mandir=/usr/share/man sysconfdir=/etc version=${pkgver}-${pkgrel}
}
