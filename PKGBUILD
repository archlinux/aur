# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-colander
pkgver=1.8.1
pkgrel=1
pkgdesc="A simple schema-based serialization and deserialization library"
url="https://docs.pylonsproject.org/projects/colander/en/latest/"
license=('BSD')
arch=('any')
depends=('python-iso8601' 'python-setuptools' 'python-translationstring')
checkdepends=('python-pytest-cov' 'python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Pylons/colander/archive/$pkgver.tar.gz")
sha512sums=('20ba1ad67aab42df3142531066fa44ce227b335962e9a423d3d26d34ffc1f931c3669a1a43769fc9c0ed5e88a28e3ebbfc78fc8575723c112e146216f923dec0')

build() {
  cd colander-$pkgver
  python setup.py build
}

check() {
  cd colander-$pkgver
  python setup.py pytest
}

package() {
  cd colander-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
