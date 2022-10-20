# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=f34-backgrounds
pkgver=34.0.1
pkgrel=4
_relnum=34
pkgdesc="Fedora $_relnum backgrounds"
arch=('any')
url="https://fedoraproject.org/wiki/F${_relnum}_Artwork"
license=('custom')
source=("https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/f/$pkgname-$pkgver-$pkgrel.fc37.src.rpm")
sha256sums=('c1db448f3018e47bc02ddbdaea3b6c2103fe045e7df37ad19b56b49d5ee765cb')

prepare() {
    tar -xvJf ./$pkgname-$pkgver.tar.xz
    rm -r ./$pkgname-$pkgver.tar.xz
    rm -r ./$pkgname.spec
}

build() {
    cd ./$pkgname
    make
}

package() {
    cd ./$pkgname
    make install DESTDIR="$pkgdir"
    install -Dm 644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

#vim: syntax=sh
