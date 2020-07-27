# Maintainer: Deepjyoti <deep.barman30@gmail.com>
pkgname=ytmdl
pkgver=2020.07.26
pkgrel=0
pkgdesc="Download songs from YouTube with metadata from sources like Itunes and Gaana"
arch=("any")
url="https://github.com/deepjyoti30/ytmdl"
license=('MIT')
depends=(
		"python>=3.6"
		"ffmpeg"
		"youtube-dl"
		"python-mutagen"
		"python-beautifulsoup4"
		"python-colorama"
		"downloader-cli"
		"python-itunespy"
		"python-ffmpeg"
		"python-pysocks"
		"python-xdg"
		"python-requests"
		"python-lxml"
		"python-wheel"
		"python-youtube-search-git"
		"python-unidecode"
		)
makedepends=("git" "python-setuptools")
optdepends=(
			"tensorflow: Trim Support"
			)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/deepjyoti30/ytmdl/archive/2020.07.26.tar.gz")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd "ytmdl-${pkgver}"
	python setup.py build
}

package() {
	cd "ytmdl-${pkgver}"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
