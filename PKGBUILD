# Maintainer: Craig Barnes <craigbarnes@protonmail.com>
pkgname='dte'
pkgver='1.10'
pkgrel='1'
pkgdesc='A small, configurable console text editor'
url='https://craigbarnes.gitlab.io/dte/'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL2')
depends=('glibc')
source=("https://craigbarnes.gitlab.io/dist/dte/dte-$pkgver.tar.gz")
sha256sums=('db62aab235764f735adc8378f796d6474596582b7dae357e0bddf31304189800')

build() {
    cd "$pkgname-$pkgver"
    make V=1
}

package() {
    cd "$pkgname-$pkgver"
    make install V=1 prefix=/usr DESTDIR="$pkgdir"
}
