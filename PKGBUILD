# Maintainer: Deepjyoti <deep.barman30@gmail.com>
pkgname=downloader-cli
pkgver=0.3.1
pkgrel=0
pkgdesc="A simple downloader with an awesome progressbar"
arch=("any")
url="https://github.com/deepjyoti30/downloader-cli"
license=('MIT')
depends=(
		"python>=3.6"
		"python-urllib3"
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
source=("https://github.com/deepjyoti30/downloader-cli/archive/0.3.1.tar.gz")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd "downloader-cli-${pkgver}"
	python setup.py build
}

package() {
	cd "downloader-cli-${pkgver}"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
