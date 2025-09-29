# Maintainer: Relish0171 <aur.such581@aleeas.com>
_basename=beets-filetote
pkgname=${_basename}-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A plugin for beets that moves non-music files during import & other operations."
arch=('any')
url="https://github.com/gtronset/beets-filetote"
license=('MIT')
depends=('python>=3.8'
    'beets')
makedepends=('python-installer')
source=("${url}/releases/download/v${pkgver}/beets_filetote-${pkgver}-py3-none-any.whl")
noextract=("${source[@]##*/}")
sha256sums=('3bf5d53b03f31dd58095c11a43e67eb99a494cee74a50159ef97951ac5415c75')

package() {
    python -m installer --destdir="${pkgdir}" "${srcdir}"/*.whl

    rm -f "${pkgdir}"/usr/lib/python*/site-packages/beetsplug/__init__.py
    rm -f "${pkgdir}"/usr/lib/python*/site-packages/beetsplug/__pycache__/__init__.cpython-*.opt-*.pyc
    rm -f "${pkgdir}"/usr/lib/python*/site-packages/beetsplug/__pycache__/__init__.cpython-*.pyc
}
