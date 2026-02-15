# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgname='python-sphinxcontrib-confluencebuilder'
pkgver=3.0
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
md5sums=('b6a0cd61d5cb748f0844aad1a0826787')

build() {
  cd "confluencebuilder-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "confluencebuilder-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
