# Maintainer: mawcomw <mawcomw@gmail.com>

pkgbase=python-rrdtool
#pkgname=('python-rrdtool' 'python2-rrdtool')
pkgname=('python2-rrdtool')
pkgver=1.4.7
pkgrel=4
arch=('i686' 'x86_64')
url="https://github.com/pbanaszkiewicz/python-rrdtool"
license=('LGPL')
#makedepends=('python2' 'python' 'rrdtool' 'cairo' 'pango' 'libxml2' 'glib2')
makedepends=('python2' 'rrdtool' 'cairo' 'pango' 'libxml2' 'glib2')
source=('https://pypi.python.org/packages/source/p/python-rrdtool/python-rrdtool-1.4.7.tar.gz')
md5sums=('7112a594ccd7759d59eaebf061ddacbd')

prepare() {
   cp -r python-rrdtool-${pkgver} python2-rrdtool-${pkgver}
}

build() {
#   cd $srcdir/python-rrdtool-${pkgver}
#   python setup.py build
    
   cd $srcdir/python2-rrdtool-${pkgver}
   python2 setup.py build
}

#check(){
#   cd $srcdir/rrdtool-${pkgver}
#   python setup.py test
#   
#   cd $srcdir/python2-rrdtool-${pkgver}
#   python2 setup.py test
#}

package_python-rrdtool() {
#   Python3 incompatible!!!
#   ===============
#
#   depends=('python' 'rrdtool')
#   pkgdesc="Working Python3 RRDTool binding"
#
#   cd python-rrdtool-${pkgver}
#   python setup.py install --root="${pkgdir}" --optimize=1
#
#   install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE

   echo "INFO: python-rrdtool library is not compatible with Python 3!"

   return 0
}

package_python2-rrdtool() {
   depends=('python2' 'rrdtool')
   pkgdesc="Working Python2 RRDTool binding"
   
   cd python2-rrdtool-${pkgver}
   python2 setup.py install --root="${pkgdir}" --optimize=1

   install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
