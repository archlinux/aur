# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Maintainer: robertfoster
# Contributor: Techmeology <techmeology@techmeology.co.uk>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
_watch=("http://miniupnp.free.fr/files/" "miniupnpc-(\d[\d.]*\d+)\.")

pkgbase=python-miniupnpc
pkgname=('python-miniupnpc' 'python2-miniupnpc')
pkgver=2.0.20180410
pkgrel=1
pkgdesc="A small UPnP client library/tool to access Internet Gateway Devices"
arch=('i686' 'x86_64')
url="http://miniupnp.free.fr"
license=('BSD')
source=("http://miniupnp.free.fr/files/${pkgbase#python-}-$pkgver.tar.gz")
makedepends=('python-setuptools' 'python2-setuptools')
sha256sums=('0e4c6d6ebc8b75eb636df7d3f3370c98713545acc3694b5ae40daa2502487a23')

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
