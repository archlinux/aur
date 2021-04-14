# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=pmbootstrap
pkgver=1.31.0
pkgrel=1
pkgdesc="Sophisticated chroot/build/flash tool to develop and install postmarketOS"
arch=('any')
url='https://postmarketos.org'
license=('GPL3')
depends=('python-setuptools')
source=("https://gitlab.com/postmarketOS/pmbootstrap/-/archive/$pkgver/pmbootstrap-$pkgver.tar.gz")
sha512sums=('c854093ed903c1df75505ac934604a679644b0cb4691a861063d1a8d5e63eb715770cb906c5bee8ae7f9f0b6a9b396b3aed88f95a4ea182fe1cae15557c8e5e9')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
