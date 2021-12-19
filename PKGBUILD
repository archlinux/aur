# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=i3-agenda
pkgver=1.6.3
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
sha256sums=('3cf1ce9b79d4b2f6845ba4a18668ced52b71c39b66f6145d2ca15dc59a9a538e')

build() {
	cd "$pkgname-$pkgver"

	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
