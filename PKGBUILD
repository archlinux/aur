# Maintainer: Vitaly Lipatov <lav@etersoft.ru>

pkgname=eepm
pkgver=3.64.61
pkgrel=1
pkgdesc="A package manager with universal interface for any platform"
arch=('any')
url="https://github.com/Etersoft/eepm/"
license=('AGPL3')
depends=(coreutils findutils diffutils file gawk grep gzip less sed bash ncurses)
makedepends=('make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Etersoft/eepm/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8f50fa5e2ceac3b4a7a901f0c539c833aaf023558779b7a0eed300aaeff18e0f')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR=$pkgdir datadir=/usr/share bindir=/usr/bin mandir=/usr/share/man sysconfdir=/etc version=${pkgver}-${pkgrel}
}
