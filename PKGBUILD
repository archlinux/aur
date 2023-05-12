# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname='mailto-uri'
pkgver=1.2.0
pkgrel=2
pkgdesc="creates mailto URIs"
arch=('any')
url="https://pypi.org/project/mailto-uri/"
license=('GPL3')
depends=('python-frontmatter')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('dc34bdd508abb156115480e6775f9cc7')

build() {
  # shellcheck disable=2154
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  python setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  # shellcheck disable=2154
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
