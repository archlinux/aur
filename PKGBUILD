# Maintainer: robertfoster

pkgname=videosnarf
pkgver=0.63
pkgrel=3
pkgdesc="A new security assessment tool for pcap analysis"
arch=('i686' 'x86_64')
url="http://ucsniff.sourceforge.net/videosnarf.html"
license=('GPL')
depends=('libpcap' 'libnet')
source=(http://downloads.sourceforge.net/project/ucsniff/$pkgname/$pkgname-$pkgver.tar.gz
  videosnarf-0.63-fix-linking.patch)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../videosnarf-0.63-fix-linking.patch
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

sha256sums=('78f84d790160e800df7a56f42e907541770fb0c8934a2ef005afb7a094dee274'
            '5c19872e28c48a4e509ca4533900acf28317f1544b1eb26b86af15f501c1af6f')
