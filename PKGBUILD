# Maintainer: Khorne <khorne AT khorne DOT me>
# Contributor: Karol Babioch <karol@babioch.de>
# Contributor: SecByShresth <shresthpaul133@gmail.com>

pkgname=python-tika
pkgver=3.1.0
pkgrel=1
pkgdesc="Apache Tika Python library"
arch=('any')
url="http://github.com/chrismattmann/tika-python"
license=('Apache')
depends=('python' 'python-requests' 'python-pyaml')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/chrismattmann/tika-python#tag=$pkgver")
sha256sums=('6de9ed2bbe62c3af1880337a74fbd8a1170ceff8a553f6761f5a14dcb1f3f354')

build() {
    cd "$srcdir/tika-python"
    python setup.py build
}


package() {
  cd "$srcdir/tika-python"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

