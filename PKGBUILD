# Maintainer: Dylan Baker <dylan@pnwbakers.com>
_name=jsonstreams
pkgname=python-${_name}
pkgver=0.3.1
pkgrel=1
pkgdesc="A Python module for writing JSON as a stream"
arch=('any')
url="https://github.com/dcbaker/jsonstreams"
license=('MIT')
depends=()
makedepends=('python-setuptools')
optdepends=('python-simplejson')
options=(!emptydirs)
source=('https://pypi.python.org/packages/b6/4e/fc68910cc9b72bca0f9ee8d8cdc7d3ef55c03ab62b2dfb9338d74639f11c/jsonstreams-0.3.1.tar.gz'
        'https://pypi.python.org/packages/b6/4e/fc68910cc9b72bca0f9ee8d8cdc7d3ef55c03ab62b2dfb9338d74639f11c/jsonstreams-0.3.1.tar.gz.asc'
        'https://raw.githubusercontent.com/dcbaker/jsonstreams/master/LICENSE')
sha256sums=('41a7f787692fc170aff94702376cf972d1ed9678638c1b8340cb9ac15d372ed7'
            'SKIP'
            '8b1cc8af45b502fd5bfce434721cb0d9a833298f05fe983ebc6c7f36d06fab59')
validpgpkeys=('5303CCAA8FFEE5A1472F3538089E1696140688EF')  # Dylan Baker <dylan@pnwbakers.com>

prepare() {
  cp LICENSE "$srcdir/${_name}-$pkgver"/
}

package() {
  cd "$srcdir/${_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
