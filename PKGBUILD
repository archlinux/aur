# Contributor: ianux <ianux@free.fr>
# Contributor: GERGE
# Maintainer: Lari Tikkanen <lartza@wippies.com>
pkgname=lottanzb
pkgver=0.6
pkgrel=5
pkgdesc="A SABnzbd+ (Usenet binary downloader) GUI front-end written in PyGTK"
arch=('i686' 'x86_64')
url="http://www.lottanzb.org/"
license=('GPL')
depends=('python2-dbus' 'python2' 'python2-configobj' 'pygtk')
makedepends=('intltool')
optdepends=('sabnzbd: for local downloading'
	    'par2cmdline: for checking and repairing downloads'
            'python2-pyopenssl: for SSL encryption and HTTPS remote access'
            'python2-feedparser: for RSS support'
            'python2-yenc: for a significantly faster decoding of downloads'
	    'unrar: for automatic extraction of downloads'
            'unzip: for automatic extraction of ZIP archives'
            'yelp: for displaying the help content'
	    'intltool: for translation support')
source=(http://launchpad.net/lottanzb/0.6/0.6/+download/$pkgname-$pkgver.tar.gz)
md5sums=('25dd324064332c68bc778dfa28b267dd')
sha1sums=('2594a0f8fcad957b626d3dad4780dfbd3a198c47')
install=${pkgname}.install

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --packaging-mode --root=${pkgdir} --prefix=/usr
}  
