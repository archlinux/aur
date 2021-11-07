# Maintainer: Deepjyoti <deep.barman30@gmail.com>
pkgname=downloader-cli
pkgver=0.3.2
pkgrel=1
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
source=("https://files.pythonhosted.org/packages/2d/84/32d0b1623b907e35e5b401d8e179e1aa0ca0684cb415d12a460d5c024103/downloader_cli-0.3.2.post1.tar.gz")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd "downloader_cli-${pkgver}.post${pkgrel}"
	python setup.py build
}

package() {
	cd "downloader_cli-${pkgver}.post${pkgrel}"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
