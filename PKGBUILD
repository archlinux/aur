# Maintainer: Arkadiusz Dzięgielewski <arek.dzski@gmail.com>
pkgname=picomc
pkgver=0.4.1
pkgrel=1
pkgdesc="A tiny CLI Minecraft launcher"
arch=('any')
url="https://github.com/sammko/picomc"
license=('MIT')
depends=("python>=3.7"
         "python-click>=7.0.0"
         "python-requests"
         "python-urllib3"
         "python-certifi"
         "python-tqdm"
         "python-coloredlogs")
source=("https://github.com/sammko/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('2078fb49e7bbc535969d10f20df63334')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
