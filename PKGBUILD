# Maintainer: Riderius <riderius.help@gmail.com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Marcel Krüger <zauguin at gmail dot com>

pkgname=stdman
pkgver=2024.07.05
pkgrel=1
pkgdesc="Formatted C++ stdlib man pages (cppreference)."
arch=(any)
url="https://github.com/jeaye/stdman"
license=('MIT')
depends=('man')
source=("${pkgname}-v${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3cd652cb76c4fc7604c2b961a726788550c01065032bcff0a706b44f2eb0f75a')
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
