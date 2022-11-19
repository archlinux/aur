# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alex Anthony <alex.anthony28991@gmail.com>

pkgname=python38-markupsafe
pkgver=2.1.1
pkgrel=1
pkgdesc="Implements a XML/HTML/XHTML Markup safe string for python38"
arch=('x86_64')
url="https://pypi.python.org/pypi/MarkupSafe"
license=('BSD')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-runner')
source=("https://github.com/pallets/markupsafe/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('6b06a5f470858409eb186d20edd129be90f31030be91fcc73e989b0a4ee51c3755cce0938edd9a7c73471d307385260f868101b5e11cc4d97c309420b5a573da')

build() {
  cd markupsafe-$pkgver
  python3.8 setup.py build
}

check() {
  cd markupsafe-$pkgver
  python3.8 setup.py pytest
}

package() {
  cd markupsafe-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1

  install -D -m644 LICENSE.rst "$pkgdir"/usr/share/licenses/python3.8-markupsafe/LICENSE.rst
}
