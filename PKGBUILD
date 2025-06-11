# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-html2image-bin
_pkgname=html2image
pkgver=2.0.7
pkgrel=2
pkgdesc="Generates images from headless browsers and html/css strings or files"
arch=('any')
url="https://github.com/vgalin/html2image"
license=('MIT')
provides=(python-html2image)
conflicts=(python-html2image)
makedepends=(python-installer)
_py='py3'
_url="https://files.pythonhosted.org/packages/${_py}/${_pkgname::1}/${_pkgname}/"
_filename="${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
depends=('python' 'python-websocket-client' 'python-requests')
source=("${_url}${_filename}")
md5sums=('e6506845b4b31b37c3e429fae8bdd611')

package() {
  python -m installer --destdir="$pkgdir" "html2image-${pkgver}-py3-none-any.whl"
  install -Dm644 "${_pkgname}-${pkgver}.dist-info/licenses/LICENSE" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
