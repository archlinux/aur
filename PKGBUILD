# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=pmbootstrap
pkgver=1.5.1
pkgrel=1
pkgdesc="Sophisticated chroot/build/flash tool to develop and install postmarketOS"
arch=('any')
url='https://postmarketos.org'
license=('GPL3')
depends=('python-setuptools')
source=("https://gitlab.com/postmarketOS/pmbootstrap/-/archive/$pkgver/pmbootstrap-$pkgver.tar.gz")
sha512sums=('c788ab9ec5cec44ce628c949f21b7b26e9395ff98f632f4bcfe65ad0e1afde826c7badedac5a8f4236fbe6a70a49f3e56714eccdd9e9025c1d87112d7834d857')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
