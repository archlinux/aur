# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>

## license not available in pypi source package

pkgname=python-soundcard
pkgver=0.4.1
pkgrel=1
pkgdesc='Play and record audio without resorting to CPython extensions'
arch=(any)
url='https://github.com/bastibe/soundcard'
license=('BSD')
depends=('pulseaudio' 'python-cffi' 'python-numpy')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('e596fda839570234e2f858a8b871edb0471c6c2b2ada248bd63ec284217c52e6255c620a0d26a69ec89f70a6b1d06a77ebdd54a7bc949dab93d6543e664f7569')

build() {
	cd "SoundCard-$pkgver"
	python setup.py build
}

package() {
	cd "SoundCard-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
