# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=osslsigncode
pkgver=1.7.1
pkgrel=4
pkgdesc="Platform-independent tool for Authenticode signing of PE/CAB/MSI files"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/osslsigncode/"
license=('GPL')
depends=('curl')
options=('!makeflags')
source=("https://downloads.sourceforge.net/project/osslsigncode/osslsigncode/osslsigncode-1.7.1.tar.gz")
sha512sums=('cc5a7e0c5baa2a98db93f1d2cc9d86e732e2a8a55fc20bf8e6aa67e2120af37c6be857dfe4b8eb8c82fd40604dbb3c845190b59c7e6b4147f06b710a256b877f')

prepare() {
  cd "$srcdir/osslsigncode-${pkgver}"
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --sbindir=/usr/bin \
    --bindir=/usr/bin
}

build() {
  cd "$srcdir/osslsigncode-${pkgver}"
  make
}

package() {
  cd "$srcdir/osslsigncode-${pkgver}"
  make DESTDIR="$pkgdir" install
}
