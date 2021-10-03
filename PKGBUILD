# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sven Schulz <omee@archlinux.de>

pkgname=ssldump
pkgver=1.4
pkgrel=1
pkgdesc="SSLv3/TLS network protocol analyzer"
url="https://github.com/adulau/ssldump"
license=('BSD')
arch=('x86_64')
depends=('json-c' 'libnet' 'libpcap' 'openssl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/adulau/ssldump/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bbe22b9a15bd4711e3786a8719b153e284ac05b5dd7ca5df7be302bf00013648')

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
