# Maintainer: Stephan Springer <buzo+arch@Lini.de>

_pkgname=python-gnupg
pkgname=python-pretty_bad_protocol
pkgver=3.1.1
pkgrel=1
pkgdesc='Another Python 3 wrapper for GnuPG'
arch=('any')
url='https://github.com/isislovecruft/python-gnupg'
license=('GPL3')
makedepends=('python-setuptools')
depends=('python' 'gnupg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/isislovecruft/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('69b74379f235a370379d0c3f890102f5fdf0b0db580a728702abdfa4be5780ba')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
