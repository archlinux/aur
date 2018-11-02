# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('python-node-semver')
pkgver=0.5.0
pkgrel=1
pkgdesc="python version of node-semver"
arch=('any')
url="https://github.com/podhmo/python-semver"
license=('MIT')
depends=()
makedepends=('python-setuptools')
source=(https://github.com/podhmo/python-semver/archive/$pkgver.tar.gz)
sha512sums=('031b7ef808ac5d36cc9d60c1b52c29ada3314870c519f0aa5123b8dec515f362fe9fdedacce3d4e35ca606ea1f91c860062b8c87c4d2a7e71b18bdf6df06b316')

build() {
  cd "$srcdir/python-semver-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/python-semver-$pkgver"
  python setup.py install --optimize=1 --root=${pkgdir}
  # install -m755 -d "${pkgdir}/usr/share/licenses/$pkgname"
  # install -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/"
}
