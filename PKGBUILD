# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>

pkgname=ficy
pkgver=1.0.21
pkgrel=1
pkgdesc='An icecast/shoutcast stream grabber suite'
arch=('any')
url='https://gitlab.com/wavexx/fIcy'
license=('LGPL2.1')
depends=()
makedepends=('make')
source=($url/-/archive/v$pkgver/fIcy-v$pkgver.zip)
sha256sums=('acace2440e6373845cb1c4e88ac84df029f435539daddf0cbfbdbe1526817436')

build() {
  cd "fIcy-v${pkgver}"
  make
}

package() {
  cd "fIcy-v${pkgver}"
  mkdir -p $pkgdir/usr/local/bin
  make DESTDIR="$pkgdir" install
}

