# Maintainer: Lam Duong <lamduong2@acm.org>

pkgname=python-fastdownload
_pkgname=fastdownload
pkgver=0.0.4
pkgrel=3
pkgdesc='Easily download, verify, and extract arcrhives. To be used with fast.ai'
arch=('any')
url='https://github.com/fastai/fastdownload'
license=('Apache')
depends=(
  python-fastcore
  python-fastprogress
)
makedepends=(
  python-setuptools
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/fastai/fastdownload/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('4229f4c76a7d19595158113d44853de820ba2476e47ede31ab4f83cd22228cba31a0431a2e2174d03bbbccc2531a6465bed2bbf54a43eef5320723ddc32dc398')

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
