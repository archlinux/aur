# Maintainer: Movies hood <admin@movies-hood.com>
pkgname=instagram-reels-downloader
pkgver=2.0.0
pkgrel=1
pkgdesc="Fast, modern GTK4 application for downloading Instagram reels"
arch=('any')
url="https://github.com/Aznit11/instagram-reels-downloader"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita>=1.5' 'yt-dlp' 'ffmpeg')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Aznit11/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c647485d9cf5fc0a7be427525b9f46dc131a8b6353d53f978a41cd4921222684')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
