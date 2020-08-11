# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-simpleaudio
_name=${pkgname#python-}
pkgver=1.0.4
pkgrel=1
pkgdesc="A simple audio playback Python extension"
arch=('any')
url="https://github.com/hamiltron/py-simple-audio"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('691c88649243544db717e7edf6a9831df112104e1aefb5f6038a5d071e8cf41d')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
