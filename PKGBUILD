# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# https://github.com/brokenpip3/my-pkgbuilds
#

pkgname=pdh
pkgver=0.3.18
pkgrel=1
pkgdesc="Pagerduty CLI for humans"
arch=('any')
url="https://github.com/mbovo/pdh"
license=('APACHE')
depends=('python-click' 'python-colorama' 'python-rich' 'python-pyaml' 'python-pdpyras' 'python-deprecation' 'python-humanize')
makedepends=(python-build python-installer python-poetry-core)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('bfa8eae81758c625d3744d73e45b19b2e85e02baa9a6cdc34d40f6d8abbd8663')

build() {
   cd "$srcdir/$pkgname-$pkgver"
   python -m build --wheel --no-isolation
}

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python -m installer --destdir="$pkgdir" dist/*.whl
}
