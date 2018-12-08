# Maintainer: Syu Takayama <syu.takayama@gmail.com>
pkgname=hashpump
pkgver=1.2.0
pkgrel=1
pkgdesc="A tool to exploit the hash length extension attack in various hashing algorithms"
arch=("i686" "x86_64")
url="https://github.com/bwall/HashPump"
license=('MIT')
depends=('openssl')
provides=("$pkgname")
makedepends=('gcc')
conflicts=("$pkgname-git")
source=("https://github.com/bwall/HashPump/archive/v$pkgver.tar.gz")
md5sums=('a2e82942ecf4bce4797bc851cb77eb02')

build() {
  cd "$srcdir/HashPump-$pkgver"
  make
}

package() {
  cd "$srcdir/HashPump-$pkgver"
  install -D -m644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.TXT"
  install -D -m755 hashpump "${pkgdir}/usr/bin/hashpump"
}
