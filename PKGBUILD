# Maintainer: tercean <cg.aur@zknt.org>
pkgname=sponskrub
pkgver=3.7.0
pkgrel=2
pkgdesc="Scrub sponsor messages from youtube videos."
arch=(any)
url="https://github.com/faissaloo/SponSkrub"
license=('GPL3')
depends=("ffmpeg")
makedepends=(dub d-compiler)
source=("https://github.com/faissaloo/SponSkrub/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('857916cad429cce52b370d062a068a34112b97b4eb54da0dda9dc77d18e6b206')

build() {
	cd "SponSkrub-$pkgver"
        dub build :sponskrub
}

package() {
	cd "SponSkrub-$pkgver"
	install -D -m755 sponskrub "$pkgdir/usr/bin/$pkgname"
}

