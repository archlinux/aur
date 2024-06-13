# Maintainer: Octopus118 <idlansdowne at gmail dot com>

pkgname=python-meshcat
_name=${pkgname#python-}
pkgver=0.3.2
pkgrel=1
pkgdesc="WebGL-based 3D visualizer for Python"
url="https://github.com/meshcat-dev/meshcat-python"
arch=('any')
license=('MIT')
depends=('ipython' 'python-numpy' 'python-pillow' 'python-pyngrok' 'python-pyzmq' 'python-tornado' 'python-u-msgpack')
makedepends=('python-setuptools')

source=("$_name-$pkgver.tar.gz"::"https://github.com/meshcat-dev/meshcat-python/archive/v$pkgver.tar.gz")

sha256sums=('42ce29a84121478a321dda88ad987729d31b8352fdfae57efeaaa8e21946e24d')

build() {
    cd $_name-python-$pkgver
    python setup.py build
}

package() {
    cd $_name-python-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -m644 -D LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
