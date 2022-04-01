# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-flake8-blind-except
pkgver=0.2.0
pkgrel=2
pkgdesc='A flake8 extension that checks for blind except: statements'
arch=('any')
license=('MIT')
url='https://github.com/elijahandrews/flake8-blind-except'
depends=('python-setuptools')
makedepends=('python-setuptools')
source=("https://github.com/elijahandrews/flake8-blind-except/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e96ca3e9cf6fa0d5f155f2136bfc150c6726591184d84f48b77385fda32727f4fa780563a7dc404bd8b0329fc2200f6ac796c5e644565155e51f4140e1eba0cd')

build() {
  cd flake8-blind-except-$pkgver
  python setup.py build
}

package() {
  cd flake8-blind-except-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
