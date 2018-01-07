# Maintainer: uzerus <szymonscholz (at) gmail.com>
pkgname=zutils
pkgver=1.6
pkgrel=1
pkgdesc="Utilities collection able to deal with any compressed and 
uncompressed files transparently. Utilities - zcat,zcmp,zdiff,zgrep,ztest,zupdate"
arch=('x86_64' 'i686')
url="http://savannah.nongnu.org/projects/zutils/"
license=('GPL3')
depends=('xz' 'lzip' 'gzip' 'bzip2')
makedepends=()
optdepends=()
provides=('zcat' 'zcmp' 'zdiff' 'zgrep' 'ztest' 'zupdate' 
'zutils')
conflicts=()
source=(http://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.lz)
md5sums=('e25c577a95088b0edb06cf2e245a5ae6')


build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr \
	--sysconfdir=/etc
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
