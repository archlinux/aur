# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgbase=python-libnacl
pkgname=('python-libnacl' 'python2-libnacl')
pkgver=1.4.4
pkgrel=1
pkgdesc='A simple ctypes based python binding to libsodium'
arch=('any')
url='http://libnacl.readthedocs.org'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'libsodium')
source=("https://pypi.python.org/packages/source/l/libnacl/libnacl-$pkgver.tar.gz")
md5sums=('797154ac51b9ca4c6cf4b2e6eff73e25')

prepare() {
  cp -r libnacl-$pkgver python2-libnacl-$pkgver
}

package_python-libnacl() {
  depends=('python' 'libsodium')

  cd "$srcdir/libnacl-$pkgver"
  python3 setup.py install --root="$pkgdir" -O1
}

package_python2-libnacl() {
  depends=('python2' 'libsodium')

  cd "$srcdir/python2-libnacl-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
}

