# Contributor: Philanecros Heliostein <philanecros@gmail.com>

pkgname=libjson
pkgver=0.8.r54.ga63d882
_commit=a63d8823b492477cc10ccd5edc6d79d2a34be585
pkgrel=1
pkgdesc="A JSON parser and printer library in C"
arch=('i686' 'x86_64')
url="https://github.com/vincenthz/libjson"
license=('LGPL-2.1-only')
depends=('glibc')
provides=("$pkgname.so")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('cf15f01baaa9102ffde0dcdd76b735a1230c4216367ef3fa4370200886df03e3')

build() {
    cd "$pkgname-$_commit"
    make
}

check() {
    cd "$pkgname-$_commit"
    make tests
}

package() {
    cd "$pkgname-$_commit"
    make DESTDIR="${pkgdir}" install
}

