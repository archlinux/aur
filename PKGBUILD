# Maintainer: Relish0171 <aur.such581@aleeas.com>
_basename=beets-filetote
pkgname=${_basename}-bin
pkgver=1.0.2
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
sha256sums=('dc5912151da0f6b09d5164094851d91875cf351c9a8734b55ccb784ec8b6ca5e')

package() {
    python -m installer --destdir="${pkgdir}" "${srcdir}"/*.whl

    rm -f "${pkgdir}"/usr/lib/python*/site-packages/beetsplug/__init__.py
    rm -f "${pkgdir}"/usr/lib/python*/site-packages/beetsplug/__pycache__/__init__.cpython-*.opt-*.pyc
    rm -f "${pkgdir}"/usr/lib/python*/site-packages/beetsplug/__pycache__/__init__.cpython-*.pyc
}
