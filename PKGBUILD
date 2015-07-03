# Maintainer: Ruben Agin <phabrics@phabrics.com>
pkgname=tme
pkgver=0.10beta_6
pkgrel=1
pkgdesc="The Machine Emulator, or tme, provides a general-purpose framework for computer emulation."
arch=('any')
license=('GPL3')
url="http://phabrics.com"
makedepends=()
depends=('libltdl' 'libnftnl' 'gtk3' 'libpcap')
source=(http://phabrics.com/$pkgname-$pkgver.tar.xz)
install=$pkgname.install
md5sums=('efee6edc5e86455747a35cf785215245')

build()
{
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-recode
  make
}

package()
{
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
