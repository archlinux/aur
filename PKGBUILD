#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=bloscpack
pkgver=0.11.0
pkgrel=1
pkgdesc='command line interface to and serialization format for Blosc.'
arch=(any)
url='https://github.com/Blosc/bloscpack'
license=(MIT)
depends=(python-blosc
         python-numpy
         python-six)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Blosc/bloscpack/archive/v${pkgver}.tar.gz)
md5sums=('e466118b1d425c64aca9ea4f44df11c8')

build()
{
    cd ${pkgname}-${pkgver}
    #sed -i -e '/blosc==/s|==1\.2\.7|>=1\.3\.2|' requirements.txt setup.py
    python setup.py build
}

package()
{
    cd ${pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}"
}
