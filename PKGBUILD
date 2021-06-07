# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=pacman-expire-cache
pkgver=0.2.1
pkgrel=1
pkgdesc="Tool for deleting old cached package files for pacman"
arch=(any)
url=http://ikn.org.uk/tool/pacman-expire-cache
license=(BSD)
makedepends=()
depends=()
source=(http://ikn.org.uk/download/tool/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('700c036459b88b86fe335a4dc41abb7139163b2300a3c1b4a5567075a6ec5a69')

package () {
    cd "$srcdir/${pkgname}-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install

    license_dir="$pkgdir"/usr/share/licenses/pacman-expire-cache
    install -d "$license_dir"
    install -m 644 LICENSE "$license_dir"/LICENSE
}
