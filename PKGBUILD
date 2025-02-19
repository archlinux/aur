# Maintainer: Marten Hoffmann <maa@mailbox.org>
# Contributor: Lam Duong <lamduong2@acm.org>

pkgname=python-fastdownload
_pkgname=fastdownload
pkgver=0.0.6
pkgrel=1
pkgdesc='Easily download, verify, and extract arcrhives. To be used with fast.ai'
arch=('any')
url='https://github.com/fastai/fastdownload'
license=('Apache-2.0')
depends=(
  python-fastcore
  python-fastprogress
)
makedepends=(
  python-setuptools
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/fastai/fastdownload/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('62168f8c20eafc7aa94017a363b2dfb68062ec337b88eb3d601d50234074be1e1a3337354d52483fe801d173534f6139e4c97041f3cdd9eb79b9179ee91325a2')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
