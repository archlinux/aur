#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=bloscpack
pkgver=0.10.0
pkgrel=3
pkgdesc='command line interface to and serialization format for Blosc.'
arch=(any)
url='https://github.com/Blosc/bloscpack'
license=(MIT)
depends=(python-blosc
         python-numpy
         python-six)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Blosc/bloscpack/archive/v${pkgver}.tar.gz)

build() {
  cd ${pkgname}-${pkgver}
  sed -i -e '/blosc==/s|==1\.2\.7|>=1\.3\.2|' requirements.txt setup.py
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}"
}
md5sums=('4cf83936289cb6286f2326b4168ff34c')
