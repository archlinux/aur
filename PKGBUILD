pkgname=yt-dlp-animepahe
pkgrel=1
pkgver=2026.5.7
url="https://github.com/asepsukasusunirvatia/${pkgname}"
pkgdesc='Animepahe extractor plugin for yt-dlp'
arch=('any')
license=('GPL-3.0-or-later')
depends=('python' 'yt-dlp')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('51bb380ad9ba989a4dbcdda15e2a5a490997f2d211f087e082e6a3afd869039d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() { 
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
