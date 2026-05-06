# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=unicodeit-gtk
pkgver=1.3.6
pkgrel=1.314
pkgdesc="A GTK IME popup for entering symbols via (La)TeX"
url='https://github.com/v--/unicodeit-gtk'
arch=('any')
license=('Unlicense')
makedepends=(git python-uv-build python-build python-installer python-wheel)
depends=(gtk4 python python-gobject python-unicodeit python-setproctitle wtype)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0165c2778c90319f0938025ad0b156cf32dd055e4438046b73178b70dd642915')

_fullsrcdir() {
    echo "${srcdir}/${pkgname}-${pkgver}"
}

build() {
    cd "$(_fullsrcdir)"
    python -m build --wheel --no-isolation
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
