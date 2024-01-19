# Maintainer: Arkadiusz Dzięgielewski <arek.dzski@gmail.com>
pkgname=picomc
pkgver=0.4.6
pkgrel=1
pkgdesc="A tiny CLI Minecraft launcher"
arch=('any')
url="https://github.com/sammko/picomc"
license=('MIT')
depends=("python"
         "python-click"
         "python-requests"
         "python-urllib3"
         "python-certifi"
         "python-tqdm"
         "python-coloredlogs"
         "python-colorama")
makedepends=("python-setuptools")
optdepends=("java-runtime: Launching Minecraft")
source=("https://github.com/sammko/picomc/releases/download/v$pkgver/picomc-$pkgver.tar.gz")
md5sums=('28f1f4a2e35a331fc5e10f3c88fac526')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
