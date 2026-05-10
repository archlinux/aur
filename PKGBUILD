# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=gazan
pkgver=0.1.0
pkgrel=1
pkgdesc="Browse, upload, download and manage cloud files with a GTK4 interface"
arch=('any')
url="https://codeberg.org/subhangadirli/gazan"
license=('GPL-3.0-or-later')
depends=('python' 'gtk4' 'libadwaita' 'rsync' 'python-gobject')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ccfe6f877b8c89e6975098b94bf9ef228cb211a4085267f20b57f3cb86c5c100')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
