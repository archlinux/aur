# Maintainer: Deepjyoti <deep.barman30@gmail.com>
pkgname=python-quickwall
pkgver=0.0.1
pkgrel=4
pkgdesc="Quickly set wallpapers from CLI directly from Unsplash."
arch=("any")
url="https://github.com/deepjyoti30/QuickWall"
license=('MIT')
depends=("python>=3.6" "python-setuptools")
makedepends=("git")
optdepends=("nitrogen>=1.6.1: Set wallpaper")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("QuickWall-$pkgver.tar.gz::https://github.com/deepjyoti30/QuickWall/archive/${pkgver}-${pkgrel}.tar.gz")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd "QuickWall-${pkgver}"
	python setup.py build
}

package() {
	cd "QuickWall-${pkgver}"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
