# Maintainer: Miodrag Tokić
# Contributor: Anton Novosyolov <anton.novosyolov@gmail.com>

pkgname=python-slacker
pkgver=0.12.0
pkgrel=1
pkgdesc='Full-featured Python interface for the Slack API'
arch=('any')
url='http://github.com/os/slacker'
license=('Apache')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::https://github.com/os/slacker/archive/v${pkgver}.tar.gz")
sha256sums=('7c96fd98ea1c56a04128744800ba35b13e7280c736de77bd805e8a1e5f27b66f')

build() {
    cd "$srcdir/slacker-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/slacker-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
