# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=string-color
pkgname="python-${_pkgname}"
pkgver=1.2.2
pkgrel=1
pkgdesc="just another mod to print strings in 256 colors in the terminal."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python' 'python-columnar' 'python-colorama')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        LICENSE)
sha256sums=('28af4a1335e562333bbd7e8653da01dd3ed28d3a2676a3c656ca5f4828ba5f4d'
            'ec423cc5506eea1ffbfc9955c3ec8f86139996963d84ff306a5ee41eda8a4ff1')
b2sums=('a36f886d706c41fefa1ee24159852b9b6b6a8b339b8f222925627b56960311e3f455b3ec2e60e6409c1fabef2f4e5bb6375d9b3e90ab6124f75eeec5746d0491'
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
