# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# https://github.com/brokenpip3/my-pkgbuilds
#

pkgname=pdh
pkgver=0.6.1
pkgrel=2
pkgdesc="Pagerduty CLI for humans"
arch=('any')
url="https://github.com/mbovo/pdh"
license=('APACHE')
depends=('python-click' 'python-colorama' 'python-rich' 'python-pyaml' 'python-pdpyras' 'python-deprecation' 'python-humanize')
makedepends=(python-build python-installer python-poetry-core)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('35abb2a708a6cfe70ea1a4d142b9dbb27e9f85e595751207eca91e3b6585403e')

build() {
   cd "$srcdir/$pkgname-$pkgver"
   python -m build --wheel --no-isolation
}

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python -m installer --destdir="$pkgdir" dist/*.whl
}
