

# Maintainer: pseudoroot <pseudoroot@protonmail.ch>
pkgname='yt-audio'
pkgver=0.1
pkgrel=1
pkgdesc="youtube-dl wrapper for downloading/managing youtube audio (with added features)."
arch=('any')
url="https://github.com/pseudoroot/yt-audio"
license=('MIT')
depends=('youtube-dl' 'ffmpeg')
makedepends=('python-setuptools')

source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('13a2535b49555c89a9bab71da5502334')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	# Install MIT licence
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
