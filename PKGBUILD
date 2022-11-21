# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=python38-gast03
pkgver=0.3.3
pkgrel=3
pkgdesc="AST that abstracts the underlying Python version"
url="https://github.com/serge-sans-paille/gast"
arch=('any')
license=('BSD')
conflicts=('python38-gast')
depends=('python38')
makedepends=('python38-setuptools')
source=("https://pypi.io/packages/source/g/gast/gast-${pkgver}.tar.gz")
sha512sums=('36869a5e0976223a5a82be8bf25a01654896f4de70affe0fec5252104ea6d1fea3eb8c5153530fcac8addc47b51535b02e3920a0e82aad11ba1ca8350cd11341')

build() {
  cd gast-$pkgver
  python3.8 setup.py build
}

package() {
  cd gast-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
