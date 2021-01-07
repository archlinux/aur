# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Eduardo Sánchez Muñoz

pkgname=dsf2flac-git
pkgver=r29.b0cf5aa
pkgrel=2
pkgdesc="Tool for converting DSF to FLAC files."
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/hank/dsf2flac"
license=(GPL2)
depends=(flac boost-libs taglib id3lib)
makedepends=(git boost cmake)
source=("git+https://github.com/hank/dsf2flac.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/dsf2flac"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/dsf2flac"
    ./autogen.sh
}

build() {
    cd "$srcdir/dsf2flac"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/dsf2flac"
    make install DESTDIR="$pkgdir"
}
