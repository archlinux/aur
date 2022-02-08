# Maintainer: dobedobedo <dobe0331 at gmail dot com>
# Contributor: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_pkgname='arcsi'
pkgname=("python-$_pkgname")
pkgver=3.8.1
pkgrel=1
pkgdesc="Atmospheric and Radiometric Correction of Satellite Imagery"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-rsgislib' 'python-kealib' 'gdal' 'python-rios' 'python-py6s')
options=(!emptydirs)
source=("https://github.com/remotesensinginfo/arcsi/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('83b069487e363b26de6a2708256b55846e19a6a8a906086ac025152268208877')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
