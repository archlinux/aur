# Maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: Patrice Peterson <runiq at archlinux dot us>

pkgname=python-sphinxcontrib-apidoc
pkgver=0.3.0
pkgrel=1
pkgdesc="A Sphinx extension for BibTeX style citations"
arch=('any')
url="https://github.com/sphinx-contrib/apidoc"
license=('BSD')
depends=('python-sphinx' 'python-pbr')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-sphinx-testing')
source=("https://pypi.io/packages/source/s/sphinxcontrib-apidoc/sphinxcontrib-apidoc-$pkgver.tar.gz")
sha256sums=('729bf592cf7b7dd57c4c05794f732dc026127275d785c2a5494521fdde773fb9')

build() {
  cd "$srcdir/sphinxcontrib-apidoc-$pkgver"
  python setup.py build
}


package() {
  cd "$srcdir/sphinxcontrib-apidoc-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

