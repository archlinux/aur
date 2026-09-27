# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Sematre <sematre at gmx dot de>
#
pkgname=python-iso639-lang
pkgver=2.6.3
pkgrel=1
pkgdesc="A lightweight library for the ISO 639 standard."
arch=(any)
url='https://github.com/LBeaudoux/iso639'
license=('MIT')
depends=('python')
makedepends=(
  python-build
  python-installer
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4aecdb49b35abd8f56bd3b83b0d8d376556bc7f62e6176a5ca28affcb8f72303')

build() {
  cd "iso639-${pkgver}"
  python -m build
}

package() {
  cd "iso639-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
