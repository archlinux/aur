pkgname=python-downwards
_name="${pkgname#python-}"
pkgver=1.3.1
pkgrel=1
pkgdesc="Read Wikipedia pages as manpages"
arch=('any')
url="https://github.com/noqqe/downwards/"
license=('MIT')
depends=('python-unidecode' 'python-click' 'python-wikipedia' 'python-wikitextparser' 'python-regex' 'python-wcwidth' 'python-mako')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('56762a54307950d76cf046d9f2f1a066733e685c632264f566368429c3d8311dc158232f053c9a65f9d75f04769e2302e91b81ee301cda5f0c52dcbc3bc6071f')

build() {
  cd "$srcdir"/downwards-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/downwards-$pkgver
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
