# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: bjo@nord-west.org

pkgname=mopidy-podcast
pkgver=4.0.0
pkgrel=1
pkgdesc="Mopidy extension for searching and browsing podcasts."
arch=('any')
url="https://github.com/tkem/mopidy-podcast"
license=('APACHE')
depends=('mopidy>=3.0' python-setuptools python-pykka python-cachetools python-uritools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tkem/mopidy-podcast/archive/v${pkgver}.tar.gz")
sha256sums=('12802cd4eabc63743cb3af6d770c99f30dabdf1fa33909722dbc1ba22e63f8eb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

