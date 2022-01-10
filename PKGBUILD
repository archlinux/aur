# Maintainer: Deepjyoti <deep.barman30@gmail.com>
pkgname=youtube-search-python

pkgver=1.5.3
pkgrel=0

pkgdesc="Search for YouTube videos, channels & playlists & get video information using link WITHOUT YouTube Data API v3"
arch=("any")
url="https://github.com/alexmercerind/youtube-search-python"
license=('MIT')
depends=(
		"python>=3.6"
		"httpx"
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
source=("https://files.pythonhosted.org/packages/7c/d9/68a29590a1912109315bc7951e402a4e5b964273a6ad2221700c32ccaa68/youtube-search-python-1.5.3.tar.gz")
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
