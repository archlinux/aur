# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=i3-agenda
pkgver=1.4
pkgrel=1
pkgdesc="Show your next google calendar event in polybar or i3-bar"
arch=('any')
url="https://github.com/rosenpin/i3-agenda"
license=('Unlicense')
groups=()
depends=("python-bidi"
	"python-google-api-python-client"
	"python-google-auth-httplib2"
	"python-google-auth-oauthlib"
	"python-aiohttp"
)
makedepends=("python-setuptools")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('ed892c8f6111094b9e0b7fb5a7e4d00ee04dd83acbb0d037e0c84e9d17c58fa5')

build() {
	cd "$pkgname-$pkgver"

	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
