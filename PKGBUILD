# Maintainer: pndpti <p.sujith303@gmail.com>
pkgname=anilist-tui
pkgver=0.1.2
pkgrel=1
pkgdesc="A terminal user interface for browsing and managing your AniList anime/manga library"
arch=('any')
url="https://github.com/pndpti/anilist-tui"
license=('MIT')

depends=('python'
         'python-textual'
         'python-httpx'
         'python-html2text'
         'python-textual-image'
         'python-pillow'
         )

makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'python-setuptools'
             )

source=("anilist_tui-${pkgver}.tar.gz::https://github.com/pndpti/anilist-tui/releases/download/v${pkgver}/anilist_tui-${pkgver}.tar.gz")

sha256sums=('9e62266217f62b0d1e323a0136eabd313539ddb46e2e1fe68413eecc33708ed5')
build() {
  cd "anilist_tui-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "anilist_tui-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
