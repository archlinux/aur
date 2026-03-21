# Maintainer: Drew Nutter <dnut@users.noreply.github.com>

pkgname=libigloo
pkgver=0.9.5
pkgrel=2
pkgdesc='Common C framework by the Icecast project'
arch=(x86_64)
url='https://ftp.osuosl.org/pub/xiph/releases/igloo'
license=("LGPL-2.0-only")
source=("$pkgname-$pkgver.tar.gz::https://ftp.osuosl.org/pub/xiph/releases/igloo/$pkgname-$pkgver.tar.gz")
sha256sums=(ea22e9119f7a2188810f99100c5155c6762d4595ae213b9ac29e69b4f0b87289)
depends=(rhash)

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
