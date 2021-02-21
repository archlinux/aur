# Maintainer: Kian Kasad (kian at kasad.com)
pkgname=chirp-daily-latest
_pkgname=chirp-daily
pkgver=20210212
pkgrel=1
pkgdesc="Latest build for GUI tool for programming ham radios"
arch=('any')
url="http://chirp.danplanet.com/"
license=('GPL3')
depends=('python2-lxml' 'python2-pyserial' 'python2-future' 'pygtk' 'gnome-themes-extra')
optdepends=('hamradio-menus')
options=(!emptydirs)
conflicts=(chirp)
provides=(chirp)
sha1sums=(975bc871d06db1e2a393d78a426b896a949f890c)
source=("https://trac.chirp.danplanet.com/chirp_daily/daily-$pkgver/chirp-daily-$pkgver.tar.gz")

build() {
  tar xvf $_pkgname-$pkgver.tar.gz
}

package() {
  cd "$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
