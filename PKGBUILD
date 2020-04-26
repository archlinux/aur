# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=sauce-finder
pkgver=2.2.1
pkgrel=1
pkgdesc="Python script to find sauce for anime images"
arch=('any')
url="https://gitlab.com/miicat/$pkgname"
license=('GPL3')
groups=()
depends=("python-requests" "python-validators" "python-click" "python-prompt_toolkit")
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
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
noextract=()
sha256sums=('cfe3cfd29585cefdd9d691842c7cff43bbd0ed8142a710c36ea8493d1de2a584')

build() {
	cd "$pkgname-v$pkgver"

	python setup.py build
}

package() {
	cd "$pkgname-v$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
