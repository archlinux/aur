# Maintainer: Cyker Way <cykerway at gmail dot com>

pkgname=python2-scikits-talkbox
pkgver=0.2.5
pkgrel=1
pkgdesc="Talkbox, a set of python modules for speech/signal processing."
arch=('any')
url="https://scikits.appspot.com/talkbox"
license=('MIT')
groups=()
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/s/scikits.talkbox/scikits.talkbox-${pkgver}.tar.gz")
sha256sums=('437efb0d0e30e1ecddf218a660c1b3581a2fd90b60d61a8340de2b105185bdfb')

build() {
  cd "$srcdir"/scikits.talkbox-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/scikits.talkbox-$pkgver
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D "$srcdir"/scikits.talkbox-$pkgver/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
