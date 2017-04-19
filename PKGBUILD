# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>

pkgname=python2-flask-restful-swagger
_pkgname=flask-restful-swagger
pkgver=0.19
pkgrel=1
pkgdesc='Extrarct swagger specs from your flask-restful project'
url='https://github.com/rantav/flask-restful-swagger'
arch=('any')
license=('MIT')
makedepends=('python2-distribute')
depends=('python2-flask>=0.8' 'python2-aniso8601')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/rantav/flask-restful-swagger/archive/${pkgver}.tar.gz")

build() {
    cd ${_pkgname}-${pkgver} 
    python2 setup.py build
}

package() {
    cd ${_pkgname}-${pkgver} 
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('f4617510f03ede95f12204602cb1e321')
