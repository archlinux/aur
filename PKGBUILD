# Maintainer: Piotr Zarycki <piotr.zarycki@gmail.com>
# Contributor: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-spotify
pkgver=5.0.0
pkgrel=1
pkgdesc="Mopidy extension for playing music from Spotify"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
  'mopidy>=4.0'
  python-pykka
  python-requests
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/mopidy/$pkgname/archive/v$pkgver.tar.gz"
)
sha256sums=('766a4320f216103db46651c2fe2b9ac6990ded43ae8a8244fad95ac6d3e1a9f8')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python3 -m pip install --no-deps --root="$pkgdir/" .
}
