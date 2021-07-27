# Maintainer: Deepjyoti <deep.barman30@gmail.com>
pkgname=youtube-search-python

pkgver=1.4.6
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
source=("https://files.pythonhosted.org/packages/00/7f/d5d14a68b94888e31b2101adf7b6f26ac365867fdb89fec4d7c2962e4968/youtube-search-python-1.4.6.tar.gz")
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
