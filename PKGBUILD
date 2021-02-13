# Maintainer: Lari Tikkanen <lartza at outlook.com>
# Contributor: ianux <ianux@free.fr>
# Contributor: GERGE

pkgname=lottanzb
pkgver=0.6
pkgrel=6
pkgdesc="A SABnzbd+ (Usenet binary downloader) GUI front-end written in PyGTK"
arch=('any')
url="https://launchpad.net/lottanzb"
license=('GPL')
depends=('python2-dbus' 'python2-configobj' 'pygtk')
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
sha256sums=('e3a1211fa3a3c486ed36219c8c5ac84b2deb9103533b69ba00e38361eb7603bd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --packaging-mode --root="${pkgdir}" --prefix=/usr
}  
