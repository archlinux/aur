# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-gpustat
_pkgname=gpustat
pkgver=0.5.0
pkgrel=1
pkgdesc="A simple command-line utility for querying and monitoring GPU status"
arch=('any')
url=https://github.com/wookayin/gpustat
license=('MIT')
depends=('python' 'python-six' 'nvidia' 'python-blessings')
makedepends=('python-setuptools')
source=("https://github.com/wookayin/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1b6cac5f3584028504f3cb8738798dfa4989f74084617ae8fce509c5b426abc7')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
