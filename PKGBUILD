# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=pmbootstrap
pkgver=1.23.0
pkgrel=1
pkgdesc="Sophisticated chroot/build/flash tool to develop and install postmarketOS"
arch=('any')
url='https://postmarketos.org'
license=('GPL3')
depends=('python-setuptools')
source=("https://gitlab.com/postmarketOS/pmbootstrap/-/archive/$pkgver/pmbootstrap-$pkgver.tar.gz")
sha512sums=('8118c405377e6a28574ff0a2cf01e48ad922da79ad04864d2e384df7e650e11aa1701a87608b9591f57363c9e85c8729aaea9ea2a646cfe2592b7b7760aad90e')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
