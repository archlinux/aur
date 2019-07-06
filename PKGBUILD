# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=pmbootstrap
pkgver=1.7.0
pkgrel=1
pkgdesc="Sophisticated chroot/build/flash tool to develop and install postmarketOS"
arch=('any')
url='https://postmarketos.org'
license=('GPL3')
depends=('python-setuptools')
source=("https://gitlab.com/postmarketOS/pmbootstrap/-/archive/$pkgver/pmbootstrap-$pkgver.tar.gz")
sha512sums=('13a6085d113ab76d7b54ff438c3ea8fec1a8a4f8cf7e5efed372a6ce8288ef5cf96b8e7aae35ec7adba6a03f2da50fa93671260bf1b96593e0519ffe3c3baa28')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
