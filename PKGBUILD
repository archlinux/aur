# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=string-color
pkgname="python-${_pkgname}"
pkgver=1.2.3
pkgrel=1
pkgdesc="just another mod to print strings in 256 colors in the terminal."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python' 'python-columnar' 'python-colorama')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        LICENSE)
sha256sums=('c2492c626bd77ca168bf13a2752fed5cf988d87bdd17853bdb7c7a0b0003c183'
            'ec423cc5506eea1ffbfc9955c3ec8f86139996963d84ff306a5ee41eda8a4ff1')
b2sums=('6b588229ccca5eb04cf3016407fa5ad721979611d6b1a27e866b24b0b278b9033bb20cf29d86d01e86db32f909bd29e3f7a148beeb33a3bfc68585bac04bf150'
        'c90fff598b2bcf1ea72df3681a24cc2bd1d8c0156483213db6ce4a013cc9f5d139a63df9ca046a64d759d34ed2f8408eeb4051e37d5a3be9763b102e35d72769')

build() {
  cd "${_pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
