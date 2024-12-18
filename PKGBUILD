# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=mopidy-local
pkgver=3.3.0
pkgrel=1
pkgdesc="Mopidy extension for local media playback"
arch=('any')
url="https://github.com/mopidy/mopidy-local"
license=('APACHE')
depends=('mopidy>=3.0'
         'python-setuptools'
         'python-uritools')
conflicts=('mopidy-local-images' 'mopidy-local-sqlite')
replaces=('mopidy-local-images' 'mopidy-local-sqlite')
provides=('mopidy-local-images' 'mopidy-local-sqlite')
makedepends=('python3' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mopidy/mopidy-local/archive/v${pkgver}.tar.gz")
sha256sums=('135f682edfb5fef88de2e37971ecb08e25852ecf2a9a11073a34553deb1c222a')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=4 sw=4 et:
