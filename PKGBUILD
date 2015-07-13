# Maintainer	- mawcomw <mawcomw@gmail.com>

pkgbase=python-django-versionfield2
pkgname=('python2-django-versionfield2' 'python-django-versionfield2')
pkgver=0.3.3
pkgrel=1
arch=('any')
url="https://github.com/tonioo/django-versionfield"
license=('BSD')
makedepends=('python2' 'python2-setuptools' 'python' 'python-setuptools')
source=( https://pypi.python.org/packages/source/d/django-versionfield2/django-versionfield2-$pkgver.tar.gz )
md5sums=( '5c10628b61fa83f2112b93b6be5de140' )

prepare() {
   mv django-versionfield2-$pkgver python-django-versionfield2-${pkgver}
   cp -r python-django-versionfield2-${pkgver} python2-django-versionfield2-${pkgver}
}

build() {
   cd $srcdir/python-django-versionfield2-${pkgver}
   python setup.py build
   
   cd $srcdir/python2-django-versionfield2-${pkgver}
   python2 setup.py build
}

#check(){
#   cd $srcdir/python-django-versionfield2-${pkgver}
#   python setup.py test
#   
#   cd $srcdir/python2-django-versionfield2-${pkgver}
#   python2 setup.py test
#}

package_python-django-versionfield2() {
   depends=('python' )
   pkgdesc="A Python3 DB Independent Custom Django Field for storing Version numbers for fast indexing."
   
   cd python-django-versionfield2-${pkgver}
   python setup.py install --root="${pkgdir}" --optimize=1

#   cd ..
#   install -Dm644 BSD.txt "${pkgdir}"/usr/share/licenses/$pkgname/BSD.txt
}

package_python2-django-versionfield2() {
   depends=('python2' )
   pkgdesc="A Python2 DB Independent Custom Django Field for storing Version numbers for fast indexing."

   cd python2-django-versionfield2-${pkgver}
   python2 setup.py install --root="${pkgdir}" --optimize=1

#   cd ..
#   install -Dm644 BSD.txt "${pkgdir}"/usr/share/licenses/$pkgname/BSD.txt
}
