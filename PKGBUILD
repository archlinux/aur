# Maintainer: mawcomw <mawcomw@gmail.com>

pkgbase=python-django-xforwardedfor-middleware
pkgname=('python-django-xforwardedfor-middleware' 'python2-django-xforwardedfor-middleware')
pkgver=1.0
pkgrel=1
arch=( 'any' )
url="https://github.com/allo-/django-xforwardedfor-middleware"
license=( 'Public Domain' )
makedepends=('python2' 'python2-setuptools' 'python' 'python-setuptools')
source=( "https://pypi.python.org/packages/source/d/django-xforwardedfor-middleware/django-xforwardedfor-middleware-${pkgver}.tar.gz" )
md5sums=( '9132e555e58762f6039e5cec4feeeb39' )

prepare() {
   mv django-xforwardedfor-middleware-1.0 python-django-xforwardedfor-middleware-${pkgver}
   cp -r python-django-xforwardedfor-middleware-${pkgver} python2-django-xforwardedfor-middleware-${pkgver}
}

build() {
   cd $srcdir/python-django-xforwardedfor-middleware-${pkgver}
   python setup.py build
   
   cd $srcdir/python2-django-xforwardedfor-middleware-${pkgver}
   python2 setup.py build
}

#check(){
#   cd $srcdir/python-django-xforwardedfor-middleware-${pkgver}
#   python2 setup.py test
#   
#   cd $srcdir/python2-django-xforwardedfor-middleware-${pkgver}
#   python setup.py test
#}

package_python-django-xforwardedfor-middleware() {
   depends=('python' )
   pkgdesc="Python3 Django X-Forwarded-For Middleware."

   cd python-django-xforwardedfor-middleware-${pkgver}
   python setup.py install --root="${pkgdir}" --optimize=1

#   install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python2-django-xforwardedfor-middleware() {
   depends=('python2' )
   pkgdesc="Python2 Django X-Forwarded-For Middleware."
   
   cd python2-django-xforwardedfor-middleware-${pkgver}
   python2 setup.py install --root="${pkgdir}" --optimize=1

#   install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
}
