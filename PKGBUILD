# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gengen
pkgver=1.4.2
pkgrel=1
pkgdesc="\"Text generator\" generator"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gengen/"
license=('GPL3')
depends=('gcc-libs')
source=("https://ftp.gnu.org/gnu/gengen/gengen-$pkgver.tar.gz"{,.sig})
sha256sums=('f49bde616c09156cf7a91f40cb37b476fcd20fe899be15ecd194ca8ed40798e9'
            'SKIP')
validpgpkeys=('D459FCC2041AC8FEF297D53EB4AA8C689E629EAC')  # Lorenzo Bettini <lorenzo.bettini@gmail.com>


build() {
  cd "$pkgname-$pkgver"

  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "$pkgname-$pkgver"

  make check
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
