# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=("python-airspeed")
pkgdesc="Templating engine for Python that aims for compatibility with Velocity library for Java"
pkgver="0.5.20"
pkgrel=1
url="https://github.com/purcell/airspeed"
license=('BSD')
arch=('any')
makedepends=("python-pbr>=1.9")
depends=('python-pbr'
         'python-six')
source=("https://github.com/purcell/airspeed/archive/$pkgver.tar.gz")
md5sums=('211567a59895a6344c7fad0e42458374')

build() {
    cd "airspeed-$pkgver"
    python setup.py build
}

package_python-airspeed(){
    cd "airspeed-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENCE 
}

