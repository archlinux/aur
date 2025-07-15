# Maintainer: Blair Bonnett <blair dot bonnett @ gmail dot com>

pkgname=beancount-reds-plugins
pkgdesc='Miscellaneous plugins for Beancount double entry accounting'
pkgver=0.4.0
pkgrel=1
url='https://github.com/redstreet/beancount_reds_plugins/'
license=('GPL-3.0-only')
arch=('any')

depends=(
  'beancount'
  'python-dateutil'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)

source=(
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz"
)
sha256sums=(
  '33ed652d9d08c6c1de472900d92a7695f6b5f864c3ad23812acd68e756ed0565'
)

build() {
    cd "${pkgname//-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" "dist/${pkgname//-/_}-$pkgver-"*.whl
}
