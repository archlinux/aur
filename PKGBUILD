# Maintainer: Kevin Andriessens <kevin@kelaun.be>
pkgname='instawow'
pkgver='1.14.1'
pkgrel=1
pkgdesc="Package manager for World of Warcraft"
arch=('x86_64')
url="https://github.com/layday/instawow"
license=('GPL')
depends=('python>=3.7.0')
makedepends=('tar')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/layday/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0ff51ea7c3551d5a3c7308c5fb7ab9a61beb5de729ac408c1965776af6b60a9f')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
