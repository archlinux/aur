# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=python-cmsis-pack-manager
_pkgname=cmsis-pack-manager
pkgver=0.3.0
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
sha256sums=('82655136c8a573a0ef81a9afe4f1f5879dacb27094fb3a1495e9430e9530e104')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}
