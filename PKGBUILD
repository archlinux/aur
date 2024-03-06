# Maintainer: koonix <me at koonix dot org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Cedric Staub <cs+aur {at} cssx.cc>

pkgname=episoder
pkgver=0.10.1
pkgrel=1
pkgdesc='Tool to tell you about new episodes of your favourite TV shows'
url='https://code.ott.net/episoder'
arch=('any')
license=('GPL3')

depends=(
	'python-beautifulsoup4'
	'python-requests'
	'python-sqlalchemy'
)

makedepends=(
	'python-setuptools'
)

source=(
	"$pkgname-$pkgver.tar.gz::$url/downloads/$pkgname-$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::$url/downloads/$pkgname-$pkgver.tar.gz.asc"
)

sha256sums=(
	'f8606a51772f00298340411c15878c785b9d16a146e0ad60e8c6baae3d85b14c'
	'SKIP'
)

validpgpkeys=(
	'C9A11B84B6AED0D4D00A43E8D9536D39C966A628' # Stefan Ott <stefan@ott.net>
)

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --install-data=/usr/share --optimize=1 --skip-build
}

# vim:noexpandtab
