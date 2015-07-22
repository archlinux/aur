# Maintainer: Ruben Agin <phabrics@phabrics.com>
pkgname=tme
pkgver=0.10
pkgrel=1
pkgdesc="The Machine Emulator, or tme, provides a general-purpose framework for computer emulation."
arch=('i686' 'x86_64')
license=('GPL3')
url="http://phabrics.com"
makedepends=()
depends=('libltdl' 'libnftnl' 'gtk3' 'libpcap')
source=(http://phabrics.com/$pkgname-$pkgver.tar.xz)
install=$pkgname.install
md5sums=('a4cf29de03ee711a1aa0313117acb505')

build()
{
  cd "$pkgname-$pkgver"
  if test "x${CARCH}" = xx86_64; then
    ./configure --prefix=/usr --disable-recode
  else
    ./configure --prefix=/usr
  fi
  make
}

package()
{
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
