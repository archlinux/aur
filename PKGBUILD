# Maintainer: Octopus118 <idlansdowne at gmail dot com>

pkgname=python-pyngrok
_name=${pkgname#python-}
pkgver=7.2.0
pkgrel=2
pkgdesc="A Python wrapper for ngrok"
url="https://github.com/alexdlaird/pyngrok"
arch=('any')
license=('MIT')
depends=('python-pyaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
conflicts=('ngrok')

source=("$_name-$pkgver.tar.gz"::"https://github.com/alexdlaird/pyngrok/archive/$pkgver.tar.gz")

sha256sums=('fe6cdb778d3cdfad0c14daf9faa8b6768142df244857e7a7cd4cfab0ab405e40')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
