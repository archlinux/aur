# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname='python-frontmatter'
pkgver=0.5.0
pkgrel=1
pkgdesc="parse and manage posts with YAML frontmatter"
arch=('any')
url="https://pypi.org/project/python-frontmatter/"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('3b2acbcc68646e9e9868f3b10f7e6782')

build() {
  # shellcheck disable=2154
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  python setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  # shellcheck disable=2154
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
