# Maintainer: Sergey Kasmy <SleeplessSloth79 [at] gmail [dot] com>
pkgname=ffpb
pkgver=0.2.0
pkgrel=2
pkgdesc='A progress bar for ffmpeg. Yay !'
arch=('any')
url="https://github.com/althonos/${pkgname}"
license=('MIT')
depends=('python' 'python-sh' 'python-tqdm')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('aa51b61a1382b2868b27019c1f0d348b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
