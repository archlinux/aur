# Contributor: graysky <graysky AT archlinux dot us>
# Contributor: some-guy94

pkgname=torrent-search
pkgver=0.11.2
pkgrel=2
pkgdesc='Looks for torrent files on different websites, and allows the user to filter the results.'
arch=('any')
url='http://torrent-search.sourceforge.net/'
license=('GPL')
depends=('python2' 'gettext' 'pygtk' 'python-lxml' 'python2-httplib2' 'dbus-python')
conflicts=('torrent-search-svn')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('501e3488fbc73d6be422b5079f75bc75b824a2c671f1061de17ab6409d0b2a67')

build() {
	cd "$pkgname"
	python2 setup.py build
}

package() {
	cd "$pkgname"
	python2 setup.py install --prefix=/usr --root="$pkgdir"
}
