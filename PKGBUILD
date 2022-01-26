# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=waybackpy
pkgver=3.0.2
pkgrel=1
pkgdesc='CLI tool that interfaces with the Internet Archives Wayback Machine API'
arch=('any')
url='https://github.com/akamhy/waybackpy'
license=('MIT')
depends=('python-requests' 'python-click')
makedepends=('python-setuptools')
provides=('python-waybackpy')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/w/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('4a8b66c5de6c1a62076de798a8b7000cad9782ec7de45ac5dc71cc00a4674c35')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  export PYTHONHASHSEED=0
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
