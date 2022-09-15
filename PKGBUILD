# Maintainer: Toni Sagrista <admin at tonisagrista dot com>

pkgname=tsnake
pkgver=0.1.5
pkgrel=1
pkgdesc='Terminal snake game written in C++'
arch=(x86_64)
url='https://codeberg.org/langurmonkey/tsnake'
license=(GPL)
depends=('bash')
makedepends=('git' 'gcc' 'ncurses')
provides=(tsnake)
conflicts=(tsnake)
source=(https://codeberg.org/langurmonkey/tsnake/archive/$pkgver.tar.gz)
md5sums=('3207dd248d3254ddb739c52ece1dc024')

build() {
    cd tsnake
    make
}

package() {
    cd tsnake
    make DESTDIR=$pkgdir PREFIX=/usr install

    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
