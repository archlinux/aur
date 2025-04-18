# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=razer-cli
pkgver=2.2.1
pkgrel=1
pkgdesc="CLI for configuring Razer devices."
arch=(any)
url="https://github.com/lolei/razer-cli"
license=('GPL3')
depends=('openrazer-daemon' 'xorg-xrdb')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2855c078cc39dca727b4e94291f509a2a702a341283d6fe4953860ee9767db1c')

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
