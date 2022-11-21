# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-requests-kerberos
pkgver=0.14.0
pkgrel=3
pkgdesc="A kerberos of useful classes and functions to be used with python-requests."
arch=('any')
url="https://github.com/requests/requests-kerberos"
license=('Apache')
depends=('python38-requests' 'python38-pyspnego' 'python38-cryptography')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest' 'python38-pyspnego' 'python38-pytest-mock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/requests/requests-kerberos/archive/v$pkgver.tar.gz")
sha512sums=('9dd6eed0d6afe4b852ba96f621be3af2965e9011bf372c5dce77e0bca18191255ea407ba313904271615d722d60029807db2d6815b24437b021b02b026eb60d6')

build() {
  cd requests-kerberos-$pkgver
  python3.8 setup.py build
}

check() {
  cd requests-kerberos-$pkgver
  py.test
}

package() {
  cd requests-kerberos-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
