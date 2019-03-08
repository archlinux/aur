# Maintainer: Toni Sagrista <admin at tonisagrista dot com>

pkgname=tsnake
pkgver=0.1.0
pkgrel=1
pkgdesc='Terminal snake game written in C++ with map support'
arch=(x86_64)
url='https://github.com/langurmonkey/tsnake'
license=(GPL)
depends=('bash')
makedepends=(git)
provides=(tsnake)
conflicts=(tsnake)
source=(git+${url}.git)
md5sums=('SKIP')

build() {
    cd tsnake
    make
}

package() {
    cd tsnake
    make DESTDIR="$pkgdir" PREFIX=/usr install

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
