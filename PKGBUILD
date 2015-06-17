# Maintainer: M0Rf30

pkgname=python2-dnschain
pkgver=0.1.0
pkgrel=1
pkgdesc="A Python DNSChain library"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/okturtles/pydnschain"
license=('MPL')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/d/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
md5sums=('08d28474c4741a6fe7c3c444831a4a79')
