# Maintainer: Relish0171 <aur.such581@aleeas.com>
_basename=beets-filetote
pkgname=${_basename}-bin
pkgver=1.3.3
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
sha256sums=('839e3ff41f50b5560f8f65cfb41557f36f9bed81855702ed2dc5ac8395d1e90a')

package() {
    python -m installer --destdir="${pkgdir}" "${srcdir}"/*.whl

    rm -f "${pkgdir}"/usr/lib/python*/site-packages/beetsplug/__init__.py
    rm -f "${pkgdir}"/usr/lib/python*/site-packages/beetsplug/__pycache__/__init__.cpython-*.opt-*.pyc
    rm -f "${pkgdir}"/usr/lib/python*/site-packages/beetsplug/__pycache__/__init__.cpython-*.pyc
}
