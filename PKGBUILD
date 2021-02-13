# Maintainer: Lari Tikkanen <lartza at outlook.com>
# Contributor: Samed Beyribey <ras0ir AT eventualis DOT org>
# Contributor: Nelson VuDu <vudu DOT curse AT gmail DOT com>

pkgname=lottanzb-bzr
_pkgname=lottanzb
pkgver=r1740
pkgrel=1
pkgdesc="A SABnzbd+ (Usenet binary downloader) GUI front-end written in PyGTK (bzr version)"
arch=('any')
url="http://www.lottanzb.org/"
license=('GPL')
depends=('python2-dbus' 'python2-configobj' 'pygtk' 'hicolor-icon-theme')
makedepends=('intltool' 'bzr' 'python-dulwich' 'python2-setuptools')
optdepends=('sabnzbd: for local downloading'
	    'par2cmdline: for checking and repairing downloads'
            'pyopenssl: for SSL encryption and HTTPS remote access'
            'python-feedparser: for RSS support'
            'python2-yenc: for a significantly faster decoding of downloads'
	    'unrar: for automatic extraction of downloads'
            'unzip: for automatic extraction of ZIP archives'
            'yelp: for displaying the help content'
	    'intltool: for translation support')
provides=('lottanzb')
conflicts=('lottanzb')
source=(bzr+lp:lottanzb)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s" "$(bzr revno)"
}

build() {
  cd "${_pkgname}"
  python2 setup.py build
}

package() {
  cd "${_pkgname}"
  python2 setup.py install --packaging-mode --root=${pkgdir} --prefix=/usr 
}
