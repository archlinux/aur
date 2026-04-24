pkgname=yt-dlp-animepahe
pkgrel=1
pkgver=2026.4.23.1
url="https://codeberg.org/Asep5K/$pkgname"
pkgdesc='Animepahe extractor plugin for yt-dlp'
arch=('any')
license=('GPL-3.0-or-later')
depends=('python' 'yt-dlp')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('82936024edb8ffca57b9ebccbef1a04f9775483a3b656136a841f053902cfa7a')

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl

}
