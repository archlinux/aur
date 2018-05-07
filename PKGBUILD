# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Maintainer: robertfoster
# Contributor: Techmeology <techmeology@techmeology.co.uk>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
_watch=("http://miniupnp.free.fr/files/" "miniupnpc-(\d[\d.]*\d+)\.")

pkgbase=python-miniupnpc
pkgname=('python-miniupnpc' 'python2-miniupnpc')
pkgver=2.1
pkgrel=1
pkgdesc="A small UPnP client library/tool to access Internet Gateway Devices"
arch=('i686' 'x86_64')
url="http://miniupnp.free.fr"
license=('BSD')
source=("http://miniupnp.free.fr/files/${pkgbase#python-}-$pkgver.tar.gz")
makedepends=('python-setuptools' 'python2-setuptools')
sha256sums=('e19fb5e01ea5a707e2a8cb96f537fbd9f3a913d53d804a3265e3aeab3d2064c6')

package_python2-miniupnpc() {
	depends=('python2')

	cd $srcdir/${pkgbase#python-}-$pkgver

	python2 setup.py build
	python2 setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-miniupnpc() {
	depends=('python')

	cd $srcdir/${pkgbase#python-}-$pkgver

	python setup.py build
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
