# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=waybackpy
pkgver=3.0.0
pkgrel=1
pkgdesc='CLI tool that interfaces with the Internet Archives Wayback Machine API'
arch=('any')
url='https://github.com/akamhy/waybackpy'
license=('MIT')
depends=('python-requests' 'python-click')
makedepends=('python-setuptools')
provides=('python-waybackpy')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/w/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('264aa84a76365e8355ede96cb6cf02a1945295724ddfb7d4a43e6f3d8f97740a')

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
