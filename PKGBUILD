# Maintainer: dobedobedo <dobe0331 at gmail dot com>
# Contributor: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_pkgname='arcsi'
pkgname=("python-$_pkgname")
pkgver=4.0.0
pkgrel=1
pkgdesc="Atmospheric and Radiometric Correction of Satellite Imagery"
arch=('any')
url='https://github.com/remotesensinginfo/arcsi'
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-rsgislib=4.1.95' 'python-kealib' 'gdal' 'python-rios' 'python-py6s')
options=(!emptydirs)
source=("https://github.com/remotesensinginfo/arcsi/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ff78ccbb4622c4ec59b66f0309d5716ba2c70b0b13b8df53e75909f27380ee2b')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
