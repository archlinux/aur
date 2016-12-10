# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=ssrc
pkgver=1.33
pkgrel=1
pkgdesc="Fast and high quality sampling rate converter"
arch=('i686' 'x86_64')
url="http://shibatch.sourceforge.net"
license=('LGPL')
depends=('glibc')
options=('!makeflags')
source=("${url}/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a663082ca11d049a20d7598328e1646c9220d68005d793f992fc0618806d713a')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  install -d "$pkgdir/usr/bin"
  install -m755 "$pkgname-$pkgver"/{ssrc,ssrc_hp} "$pkgdir/usr/bin/"
}
