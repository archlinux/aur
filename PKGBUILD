# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pytest-html
pkgver=1.20.0
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
  "a7c65cdd9d5e4d09cef2f500ca801f80c1110204f24e5b84d019c6f919b15e9e"
)

build() {
    cd "pytest-html-$pkgver"
    python setup.py build
}

package() {
    cd "pytest-html-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
