# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=aacplusenc
pkgver=0.17.5
pkgrel=1
pkgdesc="An AAC+ encoder which outputs raw AAC"
arch=('i686' 'x86_64')
url="http://teknoraver.net/software/mp4tools/"
#url="https://launchpad.net/~teknoraver/+archive/ppa"
license=('custom')
depends=('fftw')
source=(http://ppa.launchpad.net/teknoraver/ppa/ubuntu/pool/main/a/aacplusenc/aacplusenc_${pkgver}.tar.gz)
md5sums=('f9df37068517ff8598f2b0ed31b67921')

build() {
  cd "$srcdir"/$pkgname
  ./configure
  make
}

package() {
  cd "$srcdir"/$pkgname
  make INSTDIR="$pkgdir"/usr install
  install -D -m644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT
}
