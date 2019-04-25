pkgname=pam_p11
pkgver=0.3.0
pkgrel=1
pkgdesc="PAM module for using crpytographic tokens such as smart cards and usb crypto tokens for authentication"
url="https://github.com/OpenSC/pam_p11"
arch=('x86_64' 'i686')
license=('LGPL')
depends=('pkgconf' 'openssl' 'libp11' 'pam' )
source=("https://github.com/OpenSC/pam_p11/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7b48dc8750af11e16a1a16e7bb775804b5eae4c4b123c24377d6975731da4552')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --libdir=/usr/lib --disable-static
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
