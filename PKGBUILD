# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=gita
pkgver=0.15.2
pkgrel=1
pkgdesc="A command-line tool to manage multiple git repos"
arch=('any')
url="https://github.com/nosarthur/gita"
license=('MIT')
depends=('python-yaml')
makedepends=('python-setuptools')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/nosarthur/gita/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('797e0dbd091d5bd3810325eed516603cc048ba9657b465906e2f52e7f5a35242ef6966cbcece04106ca41edec584924e2e97fe3b6ff2629bad2c6e347f7538e9')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
