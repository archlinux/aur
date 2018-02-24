# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Maintainer: robertfoster
# Contributor: Techmeology <techmeology@techmeology.co.uk>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgbase=python-miniupnpc
pkgname=('python-miniupnpc' 'python2-miniupnpc')
_watch=('http://miniupnp.free.fr/files/' 'miniupnpc-(\d[\d.]*\d+)\.')
pkgver=2.0.20180222
pkgrel=1
pkgdesc="A small UPnP client library/tool to access Internet Gateway Devices"
arch=('i686' 'x86_64')
url="http://miniupnp.free.fr"
license=('BSD')
source=("http://miniupnp.free.fr/files/${pkgbase#python-}-$pkgver.tar.gz")
sha256sums=('587944686469d09f739744b3aed70c7ce753a79c40d6f1227f68a3e962665b75')

package_python2-miniupnpc() {
	depends=('python2')
	makedepends=('python2-setuptools')

	cd $srcdir/${pkgbase#python-}-$pkgver

	python2 setup.py build
	python2 setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-miniupnpc() {
	depends=('python')
	makedepends=('python-setuptools')

	cd $srcdir/${pkgbase#python-}-$pkgver

	python setup.py build
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
