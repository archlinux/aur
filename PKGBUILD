# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=yewtube
pkgver=2.10.5
pkgrel=1
pkgdesc="Terminal-based YouTube player and downloader"
arch=(any)
url="https://github.com/mps-youtube/yewtube"
license=(GPL3)
depends=(python-pylast python-pyperclip python-requests youtube-search-python yt-dlp)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=(7f377a3d8c1927ee56abf61f213895df908f880a2cec79685b21006a39eb2c9d8e0f5d2a4ac826e0a509cbc4abed3a1a1dafa80f89e59d7e6c2036f195255b89)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
