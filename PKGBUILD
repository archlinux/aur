# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgname='python-sphinxcontrib-confluencebuilder'
pkgver=3.2
pkgrel=1
pkgdesc="Sphinx extension to build Confluence® compatible markup format files and optionally publish them"
arch=('any')
url="https://github.com/sphinx-contrib/confluencebuilder"
depends=(
	'python'
	'python-sphinx'
	'python-requests'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-flit-core'
)
license=('BSD-2-Clause')
source=("https://github.com/sphinx-contrib/confluencebuilder/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('1e29fc6e57a6cf00c8948a9d80d04da1')

build() {
  cd "confluencebuilder-${pkgver}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "confluencebuilder-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
