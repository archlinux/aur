# Maintainer: jakob <grandchild@gmx.net>
# Contributor: TrialnError <autumn-wind@web.de>
# Contributor: ser <arch@random.re>

_pipname=flask-bcrypt
pkgname=python-flask-bcrypt
pkgver=1.0.1
pkgrel=1
pkgdesc="Bcrypt hashing for Flask"
arch=('any')
url="http://flask-bcrypt.readthedocs.io/en/latest/"
license=('BSD')
depends=('python-flask' 'python-bcrypt')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/maxcountryman/flask-bcrypt/archive/${pkgver}.tar.gz")
sha256sums=('db07a56750cbde187920d8c55fa8a806ba24211d9eb14399fc17bac83262ff57')

package() {
    cd $_pipname-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
