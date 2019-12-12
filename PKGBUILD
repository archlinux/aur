# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="airspeed"
_module="$_name"

pkgname=("python-$_module" "python2-$_module")
pkgdesc="Airspeed is a powerful and easy-to-use templating engine for Python that aims for a high level of compatibility with the popular Velocity library for Java"
pkgver="0.5.13"
pkgrel=1
url="https://github.com/purcell/airspeed"
license=('BSD')
arch=('any')
makedepends=("python-pbr>=1.9" "python2-pbr>=1.9")
source=("https://github.com/purcell/airspeed/archive/$pkgver.tar.gz")
md5sums=('d14ab42cb70a7f04ac6bafc12a50f82c')

build() {
    cd "$_name-$pkgver"
    python setup.py build
    python2 setup.py build
}

package_python-airspeed(){
    depends=('python-pbr'
             'python-six')
    cd "$_name-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENCE 
}

package_python2-airspeed(){
    depends=('python2-pbr'
             'python2-six')
    cd "$_name-$pkgver"             
    python2 setup.py install --root="${pkgdir}/" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENCE
}

