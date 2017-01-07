# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('python-node-semver')
pkgver=0.1.1
pkgrel=2
pkgdesc="python version of node-semver"
arch=('any')
url="https://github.com/podhmo/python-semver"
license=('MIT')
depends=()
makedepends=('python-setuptools')
source=(https://github.com/podhmo/python-semver/archive/$pkgver.tar.gz)
sha512sums=('da96b5abccfaf6718f995b386d7cce6c5a9e533f27840864ed1a81a112dfdd5da1ca60f2be58b543b05e31de3997bee833dda1cfb4c5874fd59b3d8a9e771f9b')

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
