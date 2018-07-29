# Maintainer: Thanos Apostolou <thanosapostolou@outlook.com>

pkgname=thanos-gtkhash-nemo
pkgver=1.1.1
pkgrel=1
pkgdesc="A GTK+ utility for computing message digests or checksums"
arch=('i686' 'x86_64' 'mips64el')
url="http://gtkhash.sourceforge.net/"
license=('GPL')
makedepends=('intltool' 'librsvg' 'nemo')
depends=('dconf' 'nettle' 'gtk3')
source=("https://github.com/tristanheaven/gtkhash/releases/download/v$pkgver/gtkhash-$pkgver.tar.xz")
sha256sums=('a18c09a6af5b26c79bda81ab8a1835679fefbf2b87f1df4858c42ad45729f6bf')

build() {
  cd gtkhash-$pkgver
  ./configure --prefix=/usr --disable-schemas-compile --enable-gtkhash \
              --enable-linux-crypto --enable-nettle --disable-blake2 --with-gtk=3.0 \
              --enable-nemo
  make
}

package() {
  make -C gtkhash-$pkgver DESTDIR="$pkgdir/" install
}