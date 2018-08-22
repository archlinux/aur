# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Chih-Hsuan Yen <yan12125 at gmail dot com>

pkgname=python-plaster
pkgver=1.0
_distname=plaster-$pkgver
pkgrel=2
pkgdesc="A loader interface around multiple config file formats."
arch=('any')
url="https://github.com/Pylons/plaster"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('d998cf4d51ca868f2aa72a7b4901c62183c1da759eacbe4d25a5bd2385f0a7af')

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
