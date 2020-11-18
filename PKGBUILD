# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-teletype
pkgver=1.1.0
pkgrel=1
pkgdesc='A high-level cross platform Python tty library'
arch=('x86_64')
url='https://github.com/jkwill87/teletype'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/05/4d/19c0f8e928ee75ddd324de66ef1c7fac23dd0fa60f9d5f6b2686da9e24e0/teletype-1.1.0.tar.gz")
sha256sums=('3e3c770bbcb9abe5f1ad3dbfee1a386e6e385a541c062e0d96141ed72a06af0a')

build() {
  cd "teletype-${pkgver}"
  python setup.py build
}

package() {
  cd "teletype-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
