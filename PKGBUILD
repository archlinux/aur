# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-teletype
pkgver=1.0.4
pkgrel=1
pkgdesc='A high-level cross platform Python tty library'
arch=('x86_64')
url='https://github.com/jkwill87/teletype'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/7f/9d/91222889ecf831e003f7eef5f3ebe81c35f3335357e13c1ea1d070c9768b/teletype-${pkgver}.tar.gz")
sha256sums=('b4432cceb3dcdc14bf253ea2ed89b1237ec6860a6428d674a01691679e58151d')

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