# Maintainer: Miodrag Tokić
# Contributor: Anton Novosyolov <anton.novosyolov@gmail.com>

pkgname=python-slacker
pkgver=0.14.0
pkgrel=1
pkgdesc='Full-featured Python interface for the Slack API'
arch=('any')
url='http://github.com/os/slacker'
license=('Apache')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::https://github.com/os/slacker/archive/v${pkgver}.tar.gz")
sha256sums=('ddfad064d6b478e88682377533f8cf51d7fce2f5c09152124d212551d8f8f189')

build() {
    cd "$srcdir/slacker-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/slacker-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
