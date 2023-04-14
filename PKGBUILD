# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-rdflib-jsonld
pkgver=0.5.0
pkgrel=5
pkgdesc="JSON-LD parser and serializer plugins for RDFLib"
url="https://github.com/RDFLib/rdflib-jsonld"
license=('BSD')
arch=('any')
depends=('python-rdflib')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RDFLib/rdflib-jsonld/archive/$pkgver.tar.gz")
sha512sums=('5fb1409eb201c330d89ee2fbfe9fc4b07754605bad4acc85163643d5faba7b513d52afe02f71f601a31e205f5972430f6fc487d58e7c9a4e6f5f20f0d91f2cbc')

build() {
  cd rdflib-jsonld-$pkgver
  python setup.py build
}

check() {
  cd rdflib-jsonld-$pkgver
  python setup.py nosetests
}

package() {
  cd rdflib-jsonld-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
