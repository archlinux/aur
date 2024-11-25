# Maintainer: Your Name <your.email@example.com>
pkgname=python-tokentrim
pkgver=0.1.13
pkgrel=1
pkgdesc="Token trimming utility for handling JWT tokens in Python"
arch=('any')
url="https://pypi.org/project/tokentrim/"
license=('MIT')
depends=('python')
source=("https://files.pythonhosted.org/packages/1d/db/f2c34f8ea2e216967ef3ea10ba276144fb3e0d8820de2517ff537d8e39da/tokentrim-${pkgver}.tar.gz")
sha256sums=('379e64bb0bd2d713d9e6a9142946d613249376a9234cfaad838b1b31c4d75d30')

build() {
  cd "tokentrim-${pkgver}"
  python -m build --wheel --no-isolation
}
package() {
  cd "tokentrim-${pkgver}"
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  python -m installer --destdir="$pkgdir" dist/*.whl

}
