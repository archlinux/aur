# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=string-color
pkgname="python-${_pkgname}"
pkgver=1.2.1
pkgrel=1
pkgdesc="just another mod to print strings in 256 colors in the terminal."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python' 'python-columnar' 'python-colorama')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        LICENSE)
sha256sums=('6c7a973586f12c9fbd453e22d80eb83b4b3bc44220f8cf4b051488f622edb0cd'
            'ec423cc5506eea1ffbfc9955c3ec8f86139996963d84ff306a5ee41eda8a4ff1')
b2sums=('995c5142c02686be8fba5ca56c0b1c17f47e030722cc27a7a8bf26036bc265bbcf9ee6149b9387d1e899cda8af1ff8bdd9f7a428c051b4c84ff64a29577f44c4'
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
