# Maintainer: robertfoster
# Contributor: Robert Booster > booster.devel@gmail.com
pkgbase=python-gmusicapi
pkgname=('python2-gmusicapi' 'python-gmusicapi')
pkgver="12.1.0"
pkgrel=1
pkgdesc="An unofficial client library for Google Music"
arch=('any')
url="https://github.com/simon-weber/gmusicapi"
license=('BSD')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://github.com/simon-weber/gmusicapi/archive/$pkgver.tar.gz")
conflicts=("${pkgname}-git")
provides=("${pkgname}")

package_python2-gmusicapi() {
	depends=('python2-validictory' 'python2-decorator' 'python2-requests' 'python2-dateutil'
		'python2-proboscis' 'python2-protobuf' 'python2-oauth2client' 'python2-mock'
	'python2-appdirs' 'python2-gpsoauth' 'python2-mechanicalsoup' 'python2-six' 'python2-future' 'python2-mutagen')

	cd "${pkgname##python2-}-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-gmusicapi() {
	depends=('python-validictory' 'python-decorator' 'python-requests' 'python-dateutil'
		'python-proboscis' 'python-protobuf' 'python-oauth2client' 'python-mock'
	'python-appdirs' 'python-gpsoauth' 'python-mechanicalsoup' 'python-six' 'python-future' 'python-mutagen')

	cd "${pkgname##python-}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('b1e21ab4f4662d72fc525f7d72243f10')
