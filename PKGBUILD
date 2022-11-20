# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-elementpath
pkgver=3.0.2
pkgrel=1
pkgdesc="XPath 1.0/2.0 parsers and selectors for ElementTree and lxml"
url="https://github.com/sissaschool/elementpath"
license=('MIT')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-lxml' 'python38-pytest' 'python38-xmlschema')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sissaschool/elementpath/archive/v$pkgver.tar.gz")
sha512sums=('46392cece136bd6e73285333b14a00ebbebcca70c7df42cd04021225207593ef33337fd468c12f089030f2a8adc1251660ebf762aa17f82b2f26ba902d6e89d2')

build() {
  cd elementpath-$pkgver
  python3.8 setup.py build
}

check() {
  cd elementpath-$pkgver
  python3.8 -m pytest
}

package() {
  cd elementpath-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
