# Maintainer: Octopus118 <idlansdowne at gmail dot com>

pkgname=python-pyngrok
_name=${pkgname#python-}
pkgver=7.2.3
pkgrel=1
pkgdesc="A Python wrapper for ngrok"
url="https://github.com/alexdlaird/pyngrok"
arch=('any')
license=('MIT')
depends=('python-pyaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
conflicts=('ngrok')

source=("$_name-$pkgver.tar.gz"::"https://github.com/alexdlaird/pyngrok/archive/$pkgver.tar.gz")
sha256sums=('55f0da4f76e37023b20632b2447aa34aec0fdeab6925363e2b7c82914f7304b4')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
