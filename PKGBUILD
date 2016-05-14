# Maintainer: Jack L. Frost <fbt@fleshless.org>
pkgname=lemonbar
pkgver=1.2
pkgrel=1
pkgdesc='A featherweight, lemon-scented, bar based on xcb.'
arch=( 'i686' 'x86_64' )
url='https://github.com/LemonBoy/bar'
license=( 'MIT' )
depends=( 'libxcb' )
source=( "https://github.com/LemonBoy/bar/archive/v${pkgver}.tar.gz" )

conflicts=(
	bar-aint-recursive
	bar-aint-recursive-git
	lemonbar-git
)

build() {
  cd "bar-${pkgver}"
  make
}

package() {
  cd "bar-${pkgver}"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha1sums=('cc578cac439b4500a9c03e144602dd3b0abaeaac')
