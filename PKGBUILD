# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>

pkgname=python2-pymongo
pkgver=3.12.2
pkgrel=3
pkgdesc='Python module for using MongoDB'
arch=('x86_64')
license=('Apache')
url='https://pypi.python.org/pypi/pymongo/'
depends=('python2')
makedepends=('python2-setuptools')
optdepends=('python2-pymongocrypt: for [encryption]'
            'python2-pyopenssl: for [ocsp]'
            'python2-requests: for [ocsp]'
            'python2-service-identity: for [ocsp]'
            'python2-snappy: for [snappy]'
            'python2-zstandard: for [zstd]'
            'python2-pymongo-auth-aws: for [aws]'
            'python2-dnspython: for [srv]')
source=("https://pypi.io/packages/source/p/pymongo/pymongo-$pkgver.tar.gz")
sha512sums=('ad53e3b8e4af63ced1dd26f891673264c50ad3f95871e905989cbf5e98bc4ab549e346e0be32b064dbc1404b25cee40c375f8fff495a829b0b84ee432bec056a')

build() {
  cd pymongo-$pkgver
  python2 setup.py build
}

package() {
  cd pymongo-$pkgver
  python2 setup.py install --root="$pkgdir" --skip-build --optimize=1
}

# vim:set ts=2 sw=2 et:
