# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=string-color
pkgname="python-${_pkgname}"
pkgver=1.3.0
pkgrel=1
pkgdesc="just another mod to print strings in 256 colors in the terminal."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python' 'python-columnar' 'python-colorama')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver.tar.gz"
        LICENSE)
sha256sums=('007f15c33ef178c9f3d6e55cb812cab4b7ab63df931e06b2e60afd36e3b77ca0'
            'ec423cc5506eea1ffbfc9955c3ec8f86139996963d84ff306a5ee41eda8a4ff1')
b2sums=('b042063471b1fc60069bc4463acf01ba383fbde7d23ca541fbec09858d4dcb3ab7f74ccba264c09e95d4a6e514787bce01f9b7473bd59ef4f04d70450ec2b3c2'
        'c90fff598b2bcf1ea72df3681a24cc2bd1d8c0156483213db6ce4a013cc9f5d139a63df9ca046a64d759d34ed2f8408eeb4051e37d5a3be9763b102e35d72769')

build() {
  cd "${_pkgname//-/_}-$pkgver"

  python setup.py build
}

package() {
  cd "${_pkgname//-/_}-$pkgver"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
