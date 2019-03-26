# Maintainer: Miodrag Tokić
# Contributor: Anton Novosyolov <anton.novosyolov@gmail.com>

pkgname=python-slacker
pkgver=0.9.25
pkgrel=1
pkgdesc='Full-featured Python interface for the Slack API'
arch=('any')
url='http://github.com/os/slacker'
license=('Apache')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::https://github.com/os/slacker/archive/v${pkgver}.tar.gz")
md5sums=('4805019b528b22fbf31879feaf1cbbe5')

build() {
    cd "$srcdir/slacker-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/slacker-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
