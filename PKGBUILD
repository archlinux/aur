# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=python-plaster-pastedeploy
pkgver=0.7
_distname=plaster_pastedeploy-$pkgver
pkgrel=1
pkgdesc="A loader interface around multiple config file formats."
arch=('any')
url="https://github.com/Pylons/plaster_pastedeploy"
license=('MIT')
depends=('python-plaster' 'python-pastedeploy')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('afe2da1f67a1450a739e32eedb3d69d976c8352bf3da1edc7672a99050e5f6ad')

build(){
    cd $_distname
    python setup.py build
}

check(){
    cd $_distname
    python setup.py pytest -v
}

package(){
    cd $_distname
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
    install -D LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
