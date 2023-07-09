# Maintainer: Arvedui <arvedui@posteo.de>
# Contributor: Morten Linderud <foxboron@archlinux.org>

pkgname=python-taskw
pkgver=2.0.0
pkgrel=2
pkgdesc="Python bindings for your taskwarrior database"
url="http://github.com/ralphbean/taskw"
depends=("python" "python-pytz" "python-dateutil" "python-kitchen" "task")
makedepends=('python' 'python-setuptools')
license=("GPL")
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralphbean/taskw/archive/${pkgver}.tar.gz")
sha256sums=('194c469d2be96cd47c7e0f6de214e752b195111fd4edd0731ab059baa3a2bebd')

build(){
    cd "$srcdir/taskw-$pkgver"
    python setup.py build
}

package(){

    cd "$srcdir/taskw-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
