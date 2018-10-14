# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Marcel Krüger <zauguin at gmail dot com>

pkgname=stdman
pkgver=2018.03.11
pkgrel=1
pkgdesc="Formatted C++11/14 stdlib man pages (cppreference)."
arch=(any)
url="https://github.com/jeaye/stdman"
license=('MIT')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('d29e6b34cb5ba9905360cee6adcdf8c49e7f11272521bf2e10b42917486840e8')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr --mandir=/usr/local/man
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
}
