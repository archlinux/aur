# Maintainer: Erez Raviv (erezraviv@gmail.com)
pkgname=chirp-daily
pkgver=20180325
pkgrel=1
pkgdesc="Latest build for GUI tool for programming ham radios"
arch=('any')
url="http://chirp.danplanet.com/"
license=('GPL3')
depends=('python2-lxml' 'python2-pyserial' 'pygtk' 'python2-suds')
optdepends=('hamradio-menus')
options=(!emptydirs)
conflicts=(chirp)
provides=(chirp)
install=
sha1sums=("b51160c2b179b28e7ff96972b8b37fd36a1b8b91")
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")
source=("https://trac.chirp.danplanet.com/chirp_daily/daily-20180325/chirp-daily-20180325.tar.gz")

build() {
  tar zxvf $pkgname-$pkgver.tar.gz
}

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

