# Maintainer: Erez Raviv (erezraviv@gmail.com)
pkgname=chirp-daily
pkgver=20200409
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
sha1sums=(8c332cbd36335d8b8390d5a62ea96891219bc6ce)
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")
source=("https://trac.chirp.danplanet.com/chirp_daily/daily-20200409/chirp-daily-20200409.tar.gz")

build() {
  tar xvf $pkgname-$pkgver.tar.gz
}

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

