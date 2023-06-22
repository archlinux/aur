# Maintainer: Nathan Vance <natervance@gmail.com>

pkgname=dmtool
pkgver=1.0.0
pkgrel=1
pkgdesc="A library to manipulate D&D monsters "
arch=('x86_64')
url="https://vance.fish/git/dmtool"
license=('GPL3')
depends=(confuse gcc-libs glibc)
makedepends=(nlohmann-json)
source=($url/snapshot/$pkgname-$pkgver.tar.gz{,.asc})
validpgpkeys=('2FCF3A100A5B5C0E78E41BDB215A56B23729BC81') # Nathan Vance <natervance@gmail.com>

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    # Create /etc in install dir
    install -d "$pkgdir/etc"
    make DESTDIR="$pkgdir/" install
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('6a94eb5211996b82dbf6b81f984901fff7885bcba3279ccc037c2fa2efe47830'
            'SKIP')
