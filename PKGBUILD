# Contributor: Andrew Grigorev <andrew@ei-grad.ru>
# Maintainer: DarwinSurvivor <darwinsurvivor@gmail.com>

pkgname=sorl-thumbnail
pkgver=11.12
pkgrel=3
pkgdesc="Thumbnails for Django"
arch=(any)
url="http://pypi.python.org/pypi/sorl-thumbnail/"
license=('GPL')
makedepends=('python2-distribute')
depends=('python2' 'python2-django')
source=("http://pypi.python.org/packages/source/s/sorl-thumbnail/sorl-thumbnail-${pkgver}.tar.gz")
sha1sums=('abc32461924edf3a1060d059f86dc7de44b2d268')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py build || return 1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root=$pkgdir --optimize=1 || return 1
}
