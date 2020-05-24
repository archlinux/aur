# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=python-cmsis-pack-manager
_pkgname=cmsis-pack-manager
pkgver=0.2.10
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

source=(https://github.com/ARMmbed/${_pkgname}/archive/v${pkgver}.tar.gz
       )
sha256sums=('3819e97e7d982797c06532cfa87351b4b7db89d7ba76fb5d97f2bc6d373167d7')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}
