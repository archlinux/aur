# Maintainer: Imran Iqbal <imran@imraniqbal.org>
pkgname=gepvm
pkgver=0.1.0
pkgrel=1
pkgdesc="Glorious Eggroll Proton Version Manager"
arch=("x86_64")
url="https://git.sr.ht/~imraniq/$pkgname"
license=("GPL3")
makedepends=('go')
# I messed up, will fix this in next release
source=("$url/archive/v$pkgver-1.tar.gz")
sha512sums=("70cf6bc30c1ea95502cd1b707f6b1a9a338877ba78ceda743ac28da95f340d006ecfa1de5a70e52558bca0ad07d454c986b24bce0dc1f88e66f941af2cca1f05")

build() {
    cd "$srcdir/$pkgname-v$pkgver-1"
    make $pkgname
}

check() {
    cd "$srcdir/$pkgname-v$pkgver-1"
    make test
}

package() {
    cd "$srcdir/$pkgname-v$pkgver-1"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname"
}
