# Maintainer: Deepjyoti <deep.barman30@gmail.com>
pkgname=quickwall
pkgver=0.0.4
pkgrel=0
pkgdesc="Quickly set wallpapers from CLI directly from Unsplash."
arch=("any")
url="https://github.com/deepjyoti30/QuickWall"
license=('MIT')
depends=(
		"python>=3.6"
		"python-pywal"
		"downloader-cli"
		"python-requests"
		"python-beautifulsoup4"
		"python-dbus"
		"python-simber"
		)
makedepends=("git" "python-setuptools")
optdepends=("nitrogen>=1.6.1")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/deepjyoti30/QuickWall/archive/0.0.4.tar.gz")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd "QuickWall-${pkgver}"
	python setup.py build
}

package() {
	cd "QuickWall-${pkgver}"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
