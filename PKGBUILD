# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Marcel Krüger <zauguin at gmail dot com>

pkgname=stdman
pkgver=2020.11.17
pkgrel=1
pkgdesc="Formatted C++ stdlib man pages (cppreference)."
arch=(any)
url="https://github.com/jeaye/stdman"
license=('MIT')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('6e96634c67349e402339b1faa8f99e47f4145aa110e2ad492e00676b28bb05e2')
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
