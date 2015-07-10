# Maintainer	- mawcomw <mawcomw@gmail.com>
# Contributor	- Martti Kühne <mysatyre@gmail.com>
# Contributor	- apkawa <apkawa@gmail.com>

#pkgbase=python-lepl
#pkgname=('python-lepl' 'python2-lepl')
pkgname=python2-lepl
pkgver=5.0.0
pkgrel=1
arch=('any')
url="http://www.acooke.org/lepl/index.html"
license=('LGPL')
#makedepends=('python2' 'python2-setuptools' 'python' 'python-setuptools')
source=( http://lepl.googlecode.com/files/LEPL-${pkgver}.tar.gz
		'LGPL-3.0.txt'
		'MPL-1.1.txt')
md5sums=( 'c8b3eb755234b00c66ca0c912457d629'
		'e6a600fd5e1d9cbde2d983680233ad02'
		'4fc87e887bb0ede396a78bd31155c5d6')

prepare() {
   mv LEPL-$pkgver python-lepl-${pkgver}
   cp -r python-lepl-${pkgver} python2-lepl-${pkgver}
}

build() {
#   cd $srcdir/python-lepl-${pkgver}
#   python setup.py build
   
   cd $srcdir/python2-lepl-${pkgver}
   python2 setup.py build
}

#check(){
#   cd $srcdir/python-lepl-${pkgver}
#   python setup.py test
#   
#   cd $srcdir/python2-lepl-${pkgver}
#   python2 setup.py test
#}

#package_python-lepl() {
#   depends=('python' )
#   pkgdesc="A Python3 recursive descent parser, written in Python, which has a a friendly, easy-to-use syntax"
#
#   cd python-lepl-${pkgver}
#   python setup.py install --root="${pkgdir}" --optimize=1
#
#   cd ..
#   install -Dm644 LGPL-3.0.txt "${pkgdir}"/usr/share/licenses/$pkgname/LGPL-3.0.txt
#   install -Dm644 MPL-1.1.txt "${pkgdir}"/usr/share/licenses/$pkgname/MPL-1.1.txt
#}

package() {
   depends=('python2' )
   pkgdesc="A Python2 recursive descent parser, written in Python, which has a a friendly, easy-to-use syntax"
   
   cd python2-lepl-${pkgver}
   python2 setup.py install --root="${pkgdir}" --optimize=1

   cd ..
   install -Dm644 LGPL-3.0.txt "${pkgdir}"/usr/share/licenses/$pkgname/LGPL-3.0.txt
   install -Dm644 MPL-1.1.txt "${pkgdir}"/usr/share/licenses/$pkgname/MPL-1.1.txt
}
