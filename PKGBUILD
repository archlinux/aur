# Maintainer: Asep5K <asepdev.git@gmail.com>
pkgname=yt-dlp-animepahe
pkgrel=1
pkgver=2026.5.15
url="https://github.com/yt-dlp-plugins/${pkgname}"
pkgdesc='Animepahe extractor plugin for yt-dlp'
arch=('any')
license=('GPL-3.0-or-later')
depends=('python' 'yt-dlp')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('cfac56bc1935bd221a563a4d5c078d860947766f5013f8533adb146c7eaba98b')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() { 
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dvm 644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
