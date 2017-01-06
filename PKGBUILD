# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

_pkgname=pytest-subtesthack
pkgname=python-${_pkgname}
pkgver=0.1.1
pkgrel=2
pkgdesc="A hack to explicitly set up and tear down fixtures"
arch=('any')
url="https://github.com/untitaker/${_pkgname}"
license=('custom')
makedepends=('python-setuptools')
depends=('python' 'python-pytest')
source=(${_pkgname}-${pkgver}.tar.gz::"https://github.com/untitaker/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('9700cc25e9dbe49a2d399b14ea107ab985ee40ebd0d1a7d457b05d15aa9ae632')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
