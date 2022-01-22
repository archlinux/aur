# Maintainer: Deepjyoti <deep.barman30@gmail.com>
pkgname=youtube-search-python

pkgver=1.6.0
pkgrel=0

pkgdesc="Search for YouTube videos, channels & playlists & get video information using link WITHOUT YouTube Data API v3"
arch=("any")
url="https://github.com/alexmercerind/youtube-search-python"
license=('MIT')
depends=(
		"python>=3.6"
		"python-httpx>=0.14.2"
		)
makedepends=("git" "python-setuptools")
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://files.pythonhosted.org/packages/8a/8c/e26f6d3116996c498cef6bfefd7ebc32b157df1f0958b06c8e29b4e14a39/youtube-search-python-1.6.0.tar.gz")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd "${pkgname}-${pkgver}"
	python3 setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python3 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
