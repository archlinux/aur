# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-cryptography
pkgver=3.3.2
pkgrel=1
pkgdesc="A package designed to expose cryptographic recipes and primitives to Python developers"
arch=('x86_64')
license=('Apache')
url="https://pypi.python.org/pypi/cryptography"
depends=('python2-six' 'python2-cffi' 'python2-enum34' 'python2-idna' 'python2-ipaddress'
         'python2-setuptools' 'python2-asn1crypto')
source=("https://pypi.io/packages/source/c/cryptography/cryptography-$pkgver.tar.gz")
sha512sums=('55f6ee13342b3209b1fcb310f4c4d33d22856ee785cb2347e6ad36c34e9b42f6e0d5bece8e458b09663a5b78e34c4567fe7a211b51ca71f55ccc93e3f62dc5e4')

build() {
  cd cryptography-$pkgver
  python2 setup.py build
}

package() {
  cd cryptography-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
