# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>

pkgname=python2-flask-restful-swagger
_pkgname=flask-restful-swagger
pkgver=0.15
pkgrel=1
pkgdesc='Extrarct swagger specs from your flask-restful project'
url='https://pypi.python.org/pypi/flask-restful-swagger'
arch=('any')
license=('MIT')
makedepends=('python2-distribute')
depends=('python2-flask>=0.8' 'python2-aniso8601')
source=("http://pypi.python.org/packages/source/f/$_pkgname/$_pkgname-$pkgver.tar.gz" "LICENSE")
md5sums=('a7dd46d8658b1d53667159e711ac48ac'
         '66acec11fa3b48aab9f3046ae3a62fc9')

build() {
    cd ${_pkgname}-${pkgver} 
    python2 setup.py build
}

package() {
    cd ${_pkgname}-${pkgver} 
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -D -m644 $srcdir/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
