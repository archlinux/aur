# Maintainer: Imran Iqbal <imran@imraniqbal.org>
pkgname=gepvm
pkgver=0.1.1
pkgrel=1
pkgdesc="Glorious Eggroll Proton Version Manager"
arch=("x86_64")
url="https://git.sr.ht/~imraniq/$pkgname"
license=("GPL3")
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=("0492ac4bdc1216b78ed3fb31797c65ab63ab9e01b3e96414627edd6ef9200cc316d479d5d2cd93f93f425fc1ed294769d9e9dd5c8439996d7f563ed4d5f54336")

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
