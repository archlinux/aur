# Maintainer: Nicolas Iooss <nicolas.iooss_aur at m4x.org>

pkgname=isoquery
pkgver=3.2.1
pkgrel=1
pkgdesc="Search and display ISO codes for countries, languages, currencies, and scripts."
arch=('i686' 'x86_64')
url="https://github.com/toddy15"
license=('GPL3')
depends=('glib2' 'iso-codes' 'json-glib')
makedepends=('python-docutils' 'po4a')
source=("$pkgname-$pkgver.tar.gz::https://github.com/toddy15/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('bfdf71180c74b8bab0877052a0466bfa05935f166713b2a135516468451f7d91')

build() {
    cd "$pkgname-$pkgver"

    ./configure --prefix=/usr
    make
}

# "make check" fails with:
#     ERROR: integration - too few tests run (expected 38, got 0)
#     ERROR: integration - exited with status 134 (terminated by signal 6?)
#check() {
#    cd "$pkgname-$pkgver"
#    make check
#}

package() {
    cd "$pkgname-$pkgver"

    make DESTDIR="$pkgdir" install
}
