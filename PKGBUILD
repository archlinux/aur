# Maintainer: Sergey Kasmy <SleeplessSloth79 [at] gmail [dot] com>
pkgname=ffpb
pkgver=0.4.1
pkgrel=1
pkgdesc='A progress bar for ffmpeg. Yay !'
arch=('any')
url="https://github.com/althonos/${pkgname}"
license=('MIT')
depends=('python' 'python-tqdm')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('28a040866b3654524d2b40986f475aa7c65abd13746a3ac0808f082116e52c0a')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
