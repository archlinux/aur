# Maintainer: Matthew Brian Cohen <cohen at matthewbriancohen dot com>
# Maintainer: Deepjyoti <deep.barman30@gmail.com>

pkgname=youtube-search-python
pkgver=1.6.6
pkgrel=2

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
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexmercerind/youtube-search-python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6474472d1a93df9a803eea32c939be4af9bd6af6a13ea997ab3c339d0f9f2851')

build() {
	cd "${pkgname}-${pkgver}"
	python3 setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python3 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
