# Maintainer: dobedobedo <dobe0331 at gmail dot com>
# Contributor: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_pkgname='arcsi'
pkgname=("python-$_pkgname")
pkgver=4.0.4
pkgrel=1
pkgdesc="Atmospheric and Radiometric Correction of Satellite Imagery"
arch=('any')
url='https://github.com/remotesensinginfo/arcsi'
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-rsgislib' 'python-kealib' 'gdal' 'python-rios' 'python-py6s')
options=(!emptydirs)
source=("$_pkgname-v$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('cbcc1b2f388e7d2ebd487639292c74f5ba1f40eec87f211f3ce8b100b1f35403')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
