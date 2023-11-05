# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=i3-agenda
pkgver=1.8
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
	"python-typing_extensions"
)
makedepends=()
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
sha256sums=('5084d9c47def08b6dd2d1490984ae028ec96c06079daaab2890814ec5ddc2066')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	python -m build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl
}
