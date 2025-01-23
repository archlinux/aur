# Maintainer: Stewart <goodmans at protonmail dot com>

pkgname=pricehist
pkgdesc='A command-line tool for fetching and formatting historical price data, with
support for multiple data sources and output formats.'
pkgver=1.4.12
pkgrel=1
url='https://gitlab.com/chrisberkhout/pricehist'
license=('MIT')
arch=('any')

depends=('python-cssselect' 'python-lxml' 'python-requests' 'curlify')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel' 'python-poetry-core')

source=(
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz"
)
sha256sums=(
  'a6ee727e4c4594187ab999fc9ce126779ad539d3a47491a8dbd900772e347507'
)

build() {
    cd "${pkgname//-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" "dist/${pkgname//-/_}-$pkgver-"*.whl
}
