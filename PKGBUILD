# Maintainer: Vitaly Lipatov <lav@etersoft.ru>

pkgname=eepm
pkgver=3.64.12
pkgrel=1
pkgdesc="A package manager with universal interface for any platform"
arch=('any')
url="https://github.com/Etersoft/eepm/"
license=('AGPL3')
depends=(coreutils findutils diffutils file gawk grep gzip less sed bash ncurses)
makedepends=('make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Etersoft/eepm/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bb7c4166e401efe39b1e282a2ceddbdb730c054b3df050c7f7cf70bb083b7efa')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR=$pkgdir datadir=/usr/share bindir=/usr/bin mandir=/usr/share/man sysconfdir=/etc version=${pkgver}-${pkgrel}
}
