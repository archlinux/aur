# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pytest-html
pkgver=1.21.1
pkgrel=1
pkgdesc="Plugin for generating HTML reports for pytest results"
url="https://github.com/pytest-dev/pytest-html"
arch=('any')
license=('MPL2')
depends=('python-pytest>=3.0' 'python-pytest-metadata')
optdepends=('python-ansi2html: ANSI code support')
source=(
  "https://files.pythonhosted.org/packages/source/p/pytest-html/pytest-html-$pkgver.tar.gz"
)
sha256sums=(
  "ac405ca2fc4a55b83ca59319c69552f9bc870db2378e851633970bfc7fb93928"
)

build() {
    cd "pytest-html-$pkgver"
    python setup.py build
}

package() {
    cd "pytest-html-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
