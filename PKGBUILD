# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-svg2tikz'
pkgname=('python-svg2tikz')
_module='svg2tikz'
pkgver='3.1.0'
pkgrel=1
pkgdesc="Tools for converting SVG graphics to TikZ/PGF code"
url="http://xyz2tex.github.io/svg2tikz/"
depends=('python')
optdepends=('python-inkex' 'python-lxml' 'xclip')
makedepends=('python-setuptools' 'python-build' 'python-installer')
provides=("svg2tikz=${pkgver}")
conflicts=("svg2tikz-git")
license=('custom:Other/Proprietary License')
arch=('any')
source=("https://github.com/xyz2tex/${_module}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('36f7d083d6e21693390e9626abe28d6bc9e27bf7f370796fabcf55319f9e6750')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
