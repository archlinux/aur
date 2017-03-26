# Maintainer: jakob <grandchild@gmx.net>
# Contributor: TrialnError <autumn-wind@web.de>
# Contributor: ser <arch@random.re>

_pipname=flask-bcrypt
pkgname=python2-flask-bcrypt
pkgver=0.7.1
pkgrel=2
pkgdesc="Bcrypt hashing for Flask"
arch=('any')
url="http://flask-bcrypt.readthedocs.io/en/latest/"
license=('BSD')
depends=('python2-flask' 'python2-bcrypt')
makedepends=('python2-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/maxcountryman/flask-bcrypt/archive/${pkgver}.tar.gz")
md5sums=('52747432432d6057fac3ed365c13a466')


prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package() {
    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
