# Maintainer: Johannes Wienke <languitar@semipol.de>
# Previous Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>
# Contributor: bittin

pkgname=mopidy-alsamixer
pkgver=2.0.1
pkgrel=8
pkgdesc="Mopidy extension for ALSA volume control"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=('mopidy>=3.0'
         'python-pyalsa'
         'python-pykka')
makedepends=('python' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2dcf0e2ab5ea9d91d7bf03ffb6da7a136353f4385913d5f500fdb8f05ec46fff')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=4 sw=4 et:
