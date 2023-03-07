# Maintainer: Imran Iqbal <imran@imraniqbal.org>
pkgname=gepvm
pkgver=0.2.1
pkgrel=1
pkgdesc="Glorious Eggroll's Proton Version Manager"
arch=("x86_64")
url="https://git.sr.ht/~imraniq/$pkgname"
license=("GPL3")
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=("0a94073d24caa7c340463053f99cf554a29ba8ce9c117a7284346b9807ee99b75ab2eb31b47381b712e91693e84cb909063b10799ae2d996448c52f9d911f4ee")

build() {
    cd "$srcdir/$pkgname-v$pkgver"
    make $pkgname
}

check() {
    cd "$srcdir/$pkgname-v$pkgver"
    make test
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname"
}
