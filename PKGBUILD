# Maintainer: Imran Iqbal <imran@imraniqbal.org>
pkgname=gepvm
pkgver=0.2.2
pkgrel=1
pkgdesc="Glorious Eggroll's Proton Version Manager"
arch=("x86_64")
url="https://git.sr.ht/~imraniq/$pkgname"
license=("GPL3")
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=("79f106f674d1347158e072bbb16224edca95c0726c8f442947bc2081af353ba2e4e0d4b082962a76c4d694e673f067cb92aaad37653c682d32a79dca9d688ba7")

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
