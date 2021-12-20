# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=python-cmsis-pack-manager
_pkgname=cmsis-pack-manager
pkgver=0.4.0
pkgrel=1
pkgdesc='A Python module for handling CMSIS Pack files'
arch=(any)
url='https://github.com/ARMmbed/cmsis-pack-manager'
license=('Apache')
depends=('python'
         'python-appdirs'
         'python-milksnake'
         'python-pyaml'
         'python-wheel'
         'rust'
        )

source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('35e506e8f148d9e4f0ab948db4007a64c035337cf526630d0f6f55f7f3b9b20c')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}
