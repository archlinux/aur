# Maintainer: Ash <xash at riseup d0t net>
pkgname=python-hbcl
_pkgname=hbcl
pkgver=1.4.7
pkgrel=1
pkgdesc="A Python tool to analyze and verify CD ripping logs (forked from heybrochecklog)"
provides=("heybrochecklog")
arch=('any')
url="https://github.com/doujincafe/hbcl"
license=('Apache-2.0')
depends=('python' 'python-faust-cchardet')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/doujincafe/hbcl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cf0305a50e8cc769c468b5f2e2d2481be1bcb6c1d9b647878e4fc89e5af8a067')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize 1

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
