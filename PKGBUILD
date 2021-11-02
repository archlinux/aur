# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=gita
pkgver=0.15.9
pkgrel=1
pkgdesc="A command-line tool to manage multiple git repos"
arch=('any')
url="https://github.com/nosarthur/gita"
license=('MIT')
depends=('python-yaml')
makedepends=('python-setuptools')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/nosarthur/gita/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('75bb39f5371ebee4b117afdbc80f4f26f64ed47e7dd7ff7e5f37fe934fe922df57d1ff78e2c4d806666e40aa9db7c2df7751629055716ef414e138ec5955318a')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
