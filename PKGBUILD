# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pytest-html
pkgver=2.0.0
pkgrel=1
pkgdesc="Plugin for generating HTML reports for pytest results"
url="https://github.com/pytest-dev/pytest-html"
arch=('any')
license=('MPL2')
depends=('python-pytest>=5.0' 'python-pytest-metadata')
optdepends=('python-ansi2html: ANSI code support')
source=(
  "https://files.pythonhosted.org/packages/source/p/pytest-html/pytest-html-$pkgver.tar.gz"
)
sha256sums=(
  "1428837592c94404e4112fbae76f6e512c35aab4b7d663dc3dd6ea58d2979710"
)

build() {
    cd "pytest-html-$pkgver"
    python setup.py build
}

package() {
    cd "pytest-html-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
