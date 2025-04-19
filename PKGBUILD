# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=razer-cli
pkgver=2.3.0
pkgrel=1
pkgdesc="CLI for configuring Razer devices."
arch=(any)
url="https://github.com/lolei/razer-cli"
license=('GPL3')
depends=('openrazer-daemon' 'xorg-xrdb')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0f2a0d1f5b187209e33f4476807de226fe8c3215ca9a4f43021fb49d70adbbbe')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	python -m unittest discover -v
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
