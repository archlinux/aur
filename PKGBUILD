# Maintainer: Deepjyoti <deep.barman30@gmail.com>
pkgname=playx
pkgver=1.5.2
pkgrel=0
pkgdesc="Search and play any song from terminal."
arch=("any")
url="https://github.com/NISH1001/playx"
license=('MIT')
depends=(
		"python>=3.6"
		"mpv"
		"chromium"
		"youtube-dl"
		"python-beautifulsoup4"
		"python-requests"
		"python-lxml"
		"python-selenium"
		)
makedepends=("git" "python-setuptools")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("playx-develop.tar.gz::https://github.com/NISH1001/playx/archive/v1.5.2-approximate-void.zip")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd "playx-1.5.2-approximate-void"
	python setup.py build
}

package() {
	cd "playx-1.5.2-approximate-void"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
