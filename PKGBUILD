# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>

pkgname=nevow
pkgver=0.14.4
pkgrel=1
pkgdesc="web application construction kit written in Python"
arch=('any')
url='http://pypi.python.org/pypi/Nevow'
license=('custom')
makedepends=('python2-setuptools')
depends=('python2' 'python2-twisted')

source=("https://files.pythonhosted.org/packages/source/n/nevow/Nevow-${pkgver}.tar.gz")
sha256sums=('2299a0d2a0c1312040705599d5d571acfea74df82b968c0b9264f6f45266cf6e')

build(){
    cd "$srcdir/Nevow-$pkgver"
    python2 setup.py build
}

package(){
    cd "$srcdir/Nevow-$pkgver"
    python2 setup.py install --prefix=/usr --optimize=1 --skip-build \
                             --root="$pkgdir" --install-data=/usr/share/"$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
