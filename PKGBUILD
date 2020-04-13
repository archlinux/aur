# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=i3-agenda
pkgver=1.0
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
sha256sums=("e10c1064307da02c23dbbded1da122d950202fbab6bb10ed1fba022d0f59097c")

build() {
	cd "$pkgname-$pkgver"

	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
