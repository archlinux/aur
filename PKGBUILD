# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=python-geohash
pkgver=1.0
pkgrel=4
pkgdesc="Fast, accurate python geohashing library"
arch=('any')
url="https://github.com/hkwi/python-geohash"
license=('APACHE')
depends=('python' 'python-docutils')
options=(!emptydirs)
install=${pkgname}.install
source=('https://pypi.python.org/packages/74/84/fa80c5e92854c7456b591f6e797c5be18315994afd3ef16a58694e1b5eb1/Geohash-1.0.tar.gz'
        '0001-fix-python-3.5.patch')
#source=()
#md5sums=('a7c4e57874061fae1e30dd8aa8b9b390')
sha256sums=('2dd849ebaa0bc7ee565444df4fc57ae33daa89afa24b43617556560a04b71900'
            '0acc9bd46bd11f808b97d0f6a07644204d8127ca146ea2ed8b3578d71142c39b')

build() {
  cd "${srcdir}/Geohash-${pkgver}"

  # https://github.com/vinsci/geohash/issues/4
  patch -p1 < "${srcdir}/0001-fix-python-3.5.patch"
}

package() {
  cd "$srcdir/Geohash-$pkgver"
  /usr/bin/python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
