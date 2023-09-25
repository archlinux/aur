# Maintainer: Riderius <riderius.help@gmail.com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Marcel Krüger <zauguin at gmail dot com>

pkgname=stdman
pkgver=2022.07.30
pkgrel=1
pkgdesc="Formatted C++ stdlib man pages (cppreference)."
arch=(any)
url="https://github.com/jeaye/stdman"
license=('MIT')
depends=('man')
source=("${pkgname}-v${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('332383e5999e1ac9a6210be8b256608187bb7690a2bff990372e93c2ad4e76ff')
options=(!strip)

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr --mandir=/usr/local/man
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
}
