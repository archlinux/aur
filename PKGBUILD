# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=python-plaster-pastedeploy
pkgver=0.6
_distname=plaster_pastedeploy-$pkgver
pkgrel=2
pkgdesc="A loader interface around multiple config file formats."
arch=('any')
url="https://github.com/Pylons/plaster_pastedeploy"
license=('MIT')
depends=('python-plaster' 'python-pastedeploy')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('6259d32c427bec456b0179835cba35ebb42dd171701d8cc4974ce386cf595bdd')

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
