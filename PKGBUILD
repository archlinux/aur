# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('python-node-semver')
pkgver=0.7.0
pkgrel=2
pkgdesc="python version of node-semver"
arch=('any')
url="https://github.com/podhmo/python-semver"
license=('MIT')
depends=()
makedepends=('python-setuptools' 'fakeroot')
source=(https://github.com/podhmo/python-semver/archive/$pkgver.tar.gz)
sha512sums=('9e11af16ce7a9a7f2aacd77ff14c8aa574e62bc27f902860b97fda5cc8ee19f54118e90ca39241741da657b87ec2653239b0c4255570ffe4d1ad49e2c9484e74')

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
