pkgname=pam_p11
pkgver=0.3.1
pkgrel=1
pkgdesc="PAM module for using crpytographic tokens such as smart cards and usb crypto tokens for authentication"
url="https://github.com/OpenSC/pam_p11"
arch=('x86_64' 'i686')
license=('LGPL')
depends=('pkgconf' 'openssl' 'libp11' 'pam' )
source=("https://github.com/OpenSC/pam_p11/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f6add2ba4acd3c54995eae2a1a91860943dc696ffd2beb4c3e1dc434fb4405c9')

build() {
  cd "$pkgname-$pkgver"
  ./configure --libdir=/usr/lib --disable-static
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
