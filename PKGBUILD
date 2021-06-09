# Maintainer: Arkadiusz Dzięgielewski <arek.dzski@gmail.com>
pkgname=picomc
pkgver=0.4.3
pkgrel=2
pkgdesc="A tiny CLI Minecraft launcher"
arch=('any')
url="https://github.com/sammko/picomc"
license=('MIT')
depends=("python>=3.9"
         "python-click>=7.0.0"
         "python-requests"
         "python-urllib3"
         "python-certifi"
         "python-tqdm"
         "python-coloredlogs"
         "java-runtime")
makedepends=("python-setuptools")
optdepends=("java-runtime: Launching Minecraft")
source=("https://github.com/sammko/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('897e09f9a5d31445eefd43f0bd98c8ad')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
