# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=gita
pkgver=0.15.8
pkgrel=1
pkgdesc="A command-line tool to manage multiple git repos"
arch=('any')
url="https://github.com/nosarthur/gita"
license=('MIT')
depends=('python-yaml')
makedepends=('python-setuptools')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/nosarthur/gita/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('fc1323fbdb6a85dcc0d70c9cdfbe1da8c0ec294967848e810e61041fbdbc3492c69b6cb81ce843cfd54c8de3622c06cb7cac5f45b9c3ab714fc989b7d96c9d60')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
