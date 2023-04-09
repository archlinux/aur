# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sven Schulz <omee@archlinux.de>

pkgname=ssldump
pkgver=1.7
pkgrel=1
pkgdesc="SSLv3/TLS network protocol analyzer"
url="https://github.com/adulau/ssldump"
license=('BSD')
arch=('x86_64')
depends=('json-c' 'libnet' 'libpcap' 'openssl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/adulau/ssldump/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f0857a97212898e2c0583d7240b58d6d2fe0ddf0f7a84cf31975ed01820409c3')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make DESTDIR="$pkgdir/" install
}
