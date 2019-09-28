# Maintainer: Duncan X Simpson <duncan@k7dxs.net>

pkgname=python-simplenotifications
pkgver=0.2.18
pkgrel=1
pkgdesc="Cross-platform desktop notifications"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/0Gitnick/simplenotifications"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/8e/cd/4ba716f39df018d4f61a98e334a00bc9546dc4980e9b9cf7042a66490a16/simplenotifications-0.2.18.tar.gz")
md5sums=('a6660533d118f5d43c316e21ed442c97')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"

    msg2 'Building...'
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"

    msg2 'Installing...'
    python setup.py install --root="$pkgdir" --optimize=1
}
