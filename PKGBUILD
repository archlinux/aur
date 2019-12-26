# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>

pkgname=nevow
pkgver=0.14.5
pkgrel=1
pkgdesc="web application construction kit written in Python"
arch=('any')
url='http://pypi.python.org/pypi/Nevow'
license=('custom')
makedepends=('python2-setuptools')
depends=('python2' 'python2-twisted')

source=("https://files.pythonhosted.org/packages/source/n/nevow/Nevow-${pkgver}.tar.gz")
sha256sums=('afb6ba85a5351953578c018fcdb9dfbd62f29a8d46c58bc9652bc000a27223f3')

build(){
    cd "Nevow-$pkgver"
    python2 setup.py build
}

package(){
    cd "Nevow-$pkgver"
    python2 setup.py install --prefix=/usr --optimize=1 --skip-build \
                             --root="$pkgdir" --install-data=/usr/share/"$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
