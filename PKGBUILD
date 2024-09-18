# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=yewtube
pkgver=2.12.0
pkgrel=1
pkgdesc="Terminal-based YouTube player and downloader"
arch=(any)
url="https://github.com/mps-youtube/yewtube"
license=(GPL3)
depends=(python-pip python-pylast python-pyperclip python-requests youtube-search-python yt-dlp)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=(f26ee60ba7efbc54c1a92c844e9b3b850f4e34b7e8ba1dae85b7b0c342e5e9c098d6da5df48193d9e57b0258f4a5f2512cc2011d9abebe425c482bacdbd0907d)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
