# Maintainer: Erez Raviv (erezraviv@gmail.com)
# Maintainer: Ashley Roll (ash@digitalnemesis.com)
pkgname=chirp-daily
pkgver=20200807
pkgrel=1
pkgdesc="Latest build for GUI tool for programming ham radios"
arch=('any')
url="http://chirp.danplanet.com/"
license=('GPL3')
depends=('python2-lxml' 'python2-pyserial' 'pygtk')
optdepends=('hamradio-menus')
options=(!emptydirs)
conflicts=(chirp)
provides=(chirp)
install=
sha1sums=(f263bb2d8050ff4ecacbf713adfc50e240b1b9a7)
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")
source=("https://trac.chirp.danplanet.com/chirp_daily/daily-$pkgver/chirp-daily-$pkgver.tar.gz")

build() {
  tar xvf $pkgname-$pkgver.tar.gz
}

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

