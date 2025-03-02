pkgname=pam_p11
pkgver=0.6.0
pkgrel=1
pkgdesc="PAM module for using crpytographic tokens such as smart cards and usb crypto tokens for authentication"
url="https://github.com/OpenSC/pam_p11"
arch=('x86_64' 'i686')
license=('LGPL')
depends=('pkgconf' 'openssl' 'libp11' 'pam' )
source=("https://github.com/OpenSC/pam_p11/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9c83ed3156a405c073e79a237234772dee0d7884fd7a0cadf543eca87e171733')

build() {
  cd "$pkgname-$pkgver"
  ./configure --libdir=/usr/lib --disable-static
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
