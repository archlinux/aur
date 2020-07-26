# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=python-cmsis-pack-manager
_pkgname=cmsis-pack-manager
pkgver=0.2.10
pkgrel=2
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
sha256sums=('75db335b4a7628f8fb38c3f675638c82f7b7c6873769c4f7759725583da2aa27')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}
