# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=pyarchey
pkgdesc="A simple python scrip to display an OS logo in ASCII art along with basic system information."
pkgver=0.7
pkgrel=1
arch=('i686','x86_64')
url="https://github.com/walchko/pyarchey"
license=('GPL')
arch=('any')
depends=('python' 
'python-psutil'
'python-setuptools') 
source=("https://pypi.python.org/packages/b5/92/f14e25f1aac20ec32870954697375e310a3052b17d8420450169cfeb1432/pyarchey-${pkgver}.tar.gz"
'arch.patch')
md5sums=('b953c5e1d135fafbb8ea1096b25e23bb'
         'd67e7cf939bc93d632faf6e2da1cc4e2')

prepare(){
  tar -zxvf pyarchey-${pkgver}.tar.gz
  # some fixes 
  patch -p1 -i "${srcdir}/arch.patch"
}

package(){
  cd pyarchey-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

