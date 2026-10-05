# Maintainer: Marten Hoffmann <maa@mailbox.org>
# Contributor: Lam Duong <lamduong2@acm.org>

pkgname=python-fastdownload
_pkgname=fastdownload
pkgver=0.0.8
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
sha512sums=('4d262ef4d7eb74142ad3d38fcc16030b0834d60309d988c0402580022a63dbe6a24b358911f3b811529329337aa775fa4ab8b3897a8b8bc436c5b9a94ca560cb')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
