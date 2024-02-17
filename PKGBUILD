# Maintainer: Mill Haruto <mill413@outlook.com>
pkgbase=python-mdbuilder
pkgname=('python-mdbuilder')
pkgver=1.0.7
pkgrel=1
pkgdesc='A tool to generate markdown easily'
arch=('any')
license=('MIT')
url='https://github.com/mill413/mdBuilder'
makedepends=('python-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/mill413/mdBuilder/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
  cd "$srcdir"/mdBuilder-$pkgver
  python setup.py build
}

package_python-mdbuilder() {
  depends=('python')

  cd mdBuilder-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
