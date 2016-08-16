pkgname=dsf2flac-git
pkgver=r9.75832c4
pkgrel=1
pkgdesc="Tool for converting DSF to FLAC files."
arch=('i686' 'x86_64')
url="https://github.com/hank/dsf2flac"
license=('GPL')
depends=('flac' 'boost-libs' 'id3lib')
makedepends=('git' 'boost' 'cmake')
source=("git+https://github.com/hank/dsf2flac.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/dsf2flac"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/dsf2flac"
    
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/dsf2flac"
    make install DESTDIR="$pkgdir"
}
