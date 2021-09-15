# Maintainer: Bao Trinh <qubidt at gmail dot com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>
pkgname=python2-trollius
_realname=trollius
pkgver=2.2.1
pkgrel=1
pkgdesc="Port of the Tulip project (asyncio module, PEP 3156) on Python 2.7"
arch=("any")
url="http://trollius.readthedocs.org/"
license=('APACHE')
depends=('python2' 'python2-futures' 'python2-six')
optdepends=('python2-unittest2: to pass trollius unit tests')
source=("https://pypi.python.org/packages/source/t/$_realname/$_realname-$pkgver.tar.gz")
sha512sums=('36ebc6a4125ec8a2f8b0093c1528f253e26725ffdeccb45bc9ddb51a4658c05b1b08fa5898e94b2008e49e65175ecb149aa9127bd8a986086b6d7e5fc95313c8')

build() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
