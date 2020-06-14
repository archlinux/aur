# Maintainer: redfish <redfish@galactica.pw>

pkgname=ssb-server
pkgver=16.0.1
pkgrel=2
pkgdesc="The gossip and replication server for Secure Scuttlebutt - a distributed social network"
arch=(any)
url="https://scuttlebut.io"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://github.com/ssbc/ssb-server/archive/v$pkgver.tar.gz)

options=(!strip)

prepare(){
	cd "$srcdir"
	# rapackage after patching, because we have to install from tarball
	#tar czf v$pkgver.patched.tar.gz "$pkgname-$pkgver/"
}

package(){
  # if patching in prepare(), then change to .patched.tar.gz
  npm install -g --user root --prefix "${pkgdir}/usr" "$srcdir/v${pkgver}.tar.gz"
}

sha256sums=('8a5679f767ea379dca80fc33d6234fa5085e29455cdfad391ea4f7742830e428')
