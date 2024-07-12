# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgname='python-sphinxcontrib-confluencebuilder'
pkgver='2.5.2'
pkgrel='1'
pkgdesc="Sphinx extension to build Confluence® compatible markup format files and optionally publish them"
arch=('any')
url="https://github.com/sphinx-contrib/confluencebuilder"
depends=('python' 'python-sphinx')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('BSD-2-Clause')
source=("https://github.com/sphinx-contrib/confluencebuilder/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('135de0b92be71df782134d6ee97ddd8e')

build() {
  cd "confluencebuilder-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "confluencebuilder-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
