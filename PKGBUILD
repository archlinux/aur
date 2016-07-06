pkgname=libmesode-git
pkgver=456.56eaf49
pkgrel=1
pkgdesc="Fork of libstrophe (https://github.com/strophe/libstrophe) for use with Profanity XMPP Client"
arch=('i686' 'x86_64')
url="https://github.com/boothj5/libmesode"
license=('MIT' 'GPL3')
depends=('expat')
makedepends=('git' 'doxygen')
checkdepends=('check')
provides=('libmesode')
conflicts=('libmesode')
source=('git://github.com/boothj5/libmesode.git')
sha256sums=('SKIP')
options=('staticlibs')

build() {
    cd "$srcdir/libmesode"

    ./bootstrap.sh
    ./configure --prefix=/usr
    make
    doxygen
}

check() {
    cd "$srcdir/libmesode"
    make check
}

package() {
    cd "$srcdir/libmesode"
    make DESTDIR="${pkgdir}" install
}
