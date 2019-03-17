# Maintainer: robertfoster
# Contributor: Robert Booster > booster.devel@gmail.com

pkgname=python-gmusicapi
pkgver="12.0.0"
pkgrel=1
pkgdesc="An unofficial client library for Google Music"
arch=('any')
url="https://github.com/simon-weber/gmusicapi"
license=('BSD')
depends=('python-validictory' 'python-decorator' 'python-requests' 'python-dateutil'
	'python-proboscis' 'python-protobuf' 'python-oauth2client' 'python-mock'
'python-appdirs' 'python-gpsoauth' 'python-mechanicalsoup' 'python-six' 'python-future' 'mutagen')
makedepends=('python-setuptools')
source=("https://github.com/simon-weber/gmusicapi/archive/$pkgver.tar.gz")
conflicts=("${pkgname}-git")
provides=("${pkgname}")

package() {
	cd "${pkgname##python-}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('e04f4c44ce8ca501ab29c4a85a8c669b')
