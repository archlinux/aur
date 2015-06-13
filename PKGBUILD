# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: rabyte <rabyte__gmail>

pkgname=oggconvert
pkgver=0.3.3
pkgrel=3
pkgdesc="A small utility for converting audio and video files into the Vorbis/Theora/Dirac formats"
arch=(any)
url="http://oggconvert.tristanb.net/"
license=('LGPL')
depends=('pygtk' 'gstreamer0.10-python' 'gstreamer0.10-good' 'gstreamer0.10-bad' 'libmatroska')
optdepends=('schroedinger: Dirac support')
source=(http://http.debian.net/debian/pool/main/o/oggconvert/oggconvert_0.3.3.orig.tar.gz)
#source=(http://oggconvert.tristanb.net/releases/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('ddeb96f12b67fed5bafe1888cc5231de')
sha256sums=('3da926a1b4830159acfed58c15afe278e6e662efff9fc0dfc98a5f5511b99b78')

build() {
  cd "$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir"
}
