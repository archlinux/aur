# Maintainer: Nicolas Quiénot <niQo @ aur>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: thn81 <root@scrat>

pkgname=grail
pkgver=3.1.1
pkgrel=1
pkgdesc="Gesture Recognition And Instantiation Library"
arch=('i686' 'x86_64')
url="https://launchpad.net/grail"
license=('GPL')
depends=('frame>=2.5.0' 'libxi')
makedepends=('inputproto')
conflicts=('utouch-grail')
replaces=('utouch-grail')
options=('!libtool')
source=("http://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.bz2")
md5sums=('0df1b3ec6167920f310e2effe6e2ad44')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  MAKEFLAGS="-j1"
  make ${MAKEFLAGS}
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

