# Maintainer: Tomislav Ivek <tomislav dot ivek at gmail dot com>

pkgname=python-patch-ng
pkgver=1.17.2
pkgrel=1
pkgdesc='Library to parse and apply unified diffs forked from python-patch.'
arch=('any')
url="https://github.com/conan-io/python-patch/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'fakeroot')
_name=${pkgname#python-}
source=($pkgname-$pkgver.tar.gz::"https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
#        "https://raw.githubusercontent.com/conan-io/python-patch-ng/${pkgver}/LICENSE")
md5sums=('412d77250d0d70a76a90eba3e28f3840')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --optimize=1 --root "$pkgdir"
  # install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
