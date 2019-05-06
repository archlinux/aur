# Maintainer: Miodrag Tokić
# Contributor: Anton Novosyolov <anton.novosyolov@gmail.com>

pkgname=python-slacker
pkgver=0.13.0
pkgrel=1
pkgdesc='Full-featured Python interface for the Slack API'
arch=('any')
url='http://github.com/os/slacker'
license=('Apache')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::https://github.com/os/slacker/archive/v${pkgver}.tar.gz")
sha256sums=('2e1daf53c9fadc53a8e8c94984ed33a02a35ff7893c9450ae531dc3c0e9eb1f4')

build() {
    cd "$srcdir/slacker-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/slacker-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
