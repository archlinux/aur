# Maintainer: Yuuki Galaxy <galaxy001@gmail.com>

pkgname=bittornado
pkgver=0.3.18
pkgrel=1
pkgdesc="TheSHAD0W's Experimental BitTorrent client. (lib-only, for cfv)"
arch=('any')
url="http://bittornado.com"
license=(MIT)
#depends=('python' 'wxpython' 'wxgtk')
depends=('python2' 'cfv')
conflicts=('bittorrent')
source=(http://download2.bittornado.com/download/BitTornado-$pkgver.tar.gz)
# http://download2.bittornado.com/download/BitTornado-0.3.18.tar.gz
md5sums=('faeb137036cfaaeab91afc7f62c7dc30')
sha256sums=('d9e6ad0bf5b2e9820bab809c5a4fcd94e844a57f396ac51547fe47dbe255d9e0')

build() {
  cd BitTornado-CVS
  python2 setup.py build
}

package() {
  cd $startdir/src/BitTornado-CVS
  # python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  python2 setup.py install_lib --install-dir="$pkgdir/usr/lib/python2.7/site-packages/" --optimize=1 --skip-build
}
