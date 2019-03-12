# Maintainer: Toni Sagrista <admin at tonisagrista dot com>

pkgname=tsnake
pkgver=0.1.3
pkgrel=1
pkgdesc='Terminal snake game written in C++'
arch=(x86_64)
url='https://github.com/langurmonkey/tsnake'
license=(GPL)
depends=('bash')
makedepends=(git)
provides=(tsnake)
conflicts=(tsnake)
source=(https://github.com/langurmonkey/tsnake/archive/$pkgver.tar.gz)
md5sums=('SKIP')

build() {
    cd tsnake-$pkgver
    make
}

package() {
    cd tsnake-$pkgver
    make DESTDIR=$pkgdir PREFIX=/usr install

    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
