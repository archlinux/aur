# Contributor: Andrew Grigorev <andrew@ei-grad.ru>
# Maintainer: DarwinSurvivor <darwinsurvivor@gmail.com>

pkgname=sorl-thumbnail
pkgver=12.5.0
pkgrel=3
pkgdesc="Thumbnails for Django"
arch=(any)
url="http://pypi.python.org/pypi/sorl-thumbnail/"
license=('GPL')
makedepends=('python2-distribute')
depends=('python2' 'python2-django')
source=("https://files.pythonhosted.org/packages/50/ae/632239910bc88c2c27615ed9b8f725844db67278da8a487dafaf024fd2aa/sorl-thumbnail-${pkgver}.tar.gz")
sha256sums=('8dfe5fda91a5047d1d35a0b9effe7b000764a01d648e15ca076f44e9c34b6dbd')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py build || return 1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root=$pkgdir --optimize=1 || return 1
}
