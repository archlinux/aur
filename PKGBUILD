# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>
# Maintainer: Shresth Paul <shresthpaul133@gmail.com>

# Maintainer: Your Name <your.email@example.com>
pkgname=python-nspektr
pkgver=0.5.1
pkgrel=1
pkgdesc="A distribution package dependency inspector"
arch=('any')
url="https://github.com/jaraco/nspektr"
license=('MIT')
depends=(
  'python-jaraco.context'
  'python-jaraco.functools'
  'python-more-itertools'
  'python-packaging'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools-scm'
)
source=("https://files.pythonhosted.org/packages/98/26/8721142e8f777af8de7757cc0b824bbabc67890efd611c24c58ce16a57b2/nspektr-${pkgver}.tar.gz")
sha256sums=('42bf6e9bc91bd237b957efc1982c5e706079199ff2953d83c2fd0d95e040b2b4')

build() {
  cd "nspektr-${pkgver}"
  python -m build -wn
}

package() {
  cd "nspektr-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
