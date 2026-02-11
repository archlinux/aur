# Maintainer: Guillaume Hayot <ghayot@postblue.info>
pkgname=keyboardsounds
pkgver=2.4.2
pkgrel=1
pkgdesc='makes any keyboard sound like a mechanical keyboard'
arch=('any')
url='https://github.com/nathan-fiscaletti/keyboardsounds'
license=('GNU Affero General Public License')
source=(https://github.com/nathan-fiscaletti/$pkgname/archive/refs/tags/$pkgver.tar.gz)
depends=('python' 'python-pygame' 'python-imageio-ffmpeg' 'python-pydub' 'python-pynput')
sha256sums=('f94e5fadf4ed1e3cef37d49c2b757c60f2817872b6bd54104601b831dd1458a0')
makedepends=(python-build python-installer python-wheel)

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
