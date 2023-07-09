# Maintainer: Arvedui <arvedui@posteo.de>
# Contributor: Morten Linderud <foxboron@archlinux.org>

pkgname=python2-taskw
pkgver=1.3.1
pkgrel=3
pkgdesc="Python bindings for your taskwarrior database"
url="http://github.com/ralphbean/taskw"
depends=("python2" "python2-six" "python2-pytz"
         "python2-dateutil" "python2-kitchen"
         "task")
makedepends=( 'python2' 'python2-setuptools')
license=("GPL")
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralphbean/taskw/archive/${pkgver}.tar.gz")
sha256sums=('811218b490a69560f8673b3d1946b45d3ad43abff4ebd4aa9409569bb6b41dd1')

build(){
    cd "$srcdir/taskw-$pkgver"
    python2 setup.py build
}

package_python2-taskw(){

    cd "$srcdir/taskw-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
