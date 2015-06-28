# Maintainer: mawcomw <mawcomw@gmail.com>

pkgbase=python-sievelib
#pkgname=('python-sievelib' 'python2-sievelib')
pkgname=('python2-sievelib')
pkgver=0.8
pkgrel=3
arch=('i686' 'x86_64')
url="http://bitbucket.org/tonioo/sievelib"
license=('MIT')
#makedepends=('python2' 'python')
makedepends=('python2')
source=("https://pypi.python.org/packages/source/s/sievelib/sievelib-$pkgver.tar.gz")
md5sums=('0bcf3cf7b166944c609b71f0ac69ca0a')

prepare() {
   cp -r sievelib-${pkgver} python2-sievelib-${pkgver}
}

build() {
#   cd $srcdir/sievelib-${pkgver}
#   python setup.py build

   cd $srcdir/python2-sievelib-${pkgver}
   python2 setup.py build
}

#check(){
#   cd $srcdir/sievelib-${pkgver}
#   python setup.py test
#   
#   cd $srcdir/python2-sievelib-${pkgver}
#   python2 setup.py test
#}

package_python-sievelib() {
#   Python3 incompatible!!!
#   ===============
#
#   depends=('python' )
#   pkgdesc="Python3 Client-side SIEVE library"
#
#   cd sievelib-${pkgver}
#   python setup.py install --root="${pkgdir}" --optimize=1
#
#   install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/$pkgname/COPYING

   echo "INFO: python-sievelib library is not compatible with Python 3!"

   return 0
}

package_python2-sievelib() {
   depends=('python2' )
   pkgdesc="Python2 Client-side SIEVE library"
   
   cd python2-sievelib-${pkgver}
   python2 setup.py install --root="${pkgdir}" --optimize=1

   install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/$pkgname/COPYING
}
