# Maintainer: Marko Semet <marko10_000@mailbox.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>

_name=pyroaring
pkgname=python-$_name
pkgver=0.4.5
pkgrel=1
pkgdesc="Fast and lightweight set for unsigned 32 bits integers"
arch=('x86_64')
url="https://pypi.org/pypi/$_name"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('816c93baa5c729ff906056ffedf723c9cddaf1ea988a882e0ec5062ae9ea673c')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
