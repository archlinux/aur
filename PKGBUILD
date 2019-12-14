# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=pmbootstrap
pkgver=1.12.0
pkgrel=1
pkgdesc="Sophisticated chroot/build/flash tool to develop and install postmarketOS"
arch=('any')
url='https://postmarketos.org'
license=('GPL3')
depends=('python-setuptools')
source=("https://gitlab.com/postmarketOS/pmbootstrap/-/archive/$pkgver/pmbootstrap-$pkgver.tar.gz")
sha512sums=('fe0785a88abc38ac27c5ff52a84daac0712e1b28e5ec6883de3f3bb87ddec07458feffe070c0ac76deee454ffa42bc6687697f6ce39f50cbc0103d5a7c7458fe')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
