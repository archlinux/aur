# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="airspeed"
_module="$_name"

pkgname=("python-$_module" "python2-$_module")
pkgdesc="Airspeed is a powerful and easy-to-use templating engine for Python that aims for a high level of compatibility with the popular Velocity library for Java"
pkgver="0.5.4"
pkgrel=3
url="https://github.com/purcell/airspeed"
license=('BSD')
arch=('any')
makedepends=("python-pbr>=1.9" "python2-pbr>=1.9")
source=("https://github.com/purcell/airspeed/archive/$pkgver.tar.gz")
md5sums=('9477043347028e8d1ea122b3b1e6f994')

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

