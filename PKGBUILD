# Maintainer: Dylan Baker <dylan@pnwbakers.com>
_name=jsonstreams
pkgname=python2-${_name}
pkgver=0.4.1
pkgrel=1
pkgdesc="A Python module for writing JSON as a stream"
arch=('any')
url="https://github.com/dcbaker/jsonstreams"
license=('MIT')
depends=()
depends=('python2-enum34')
optdepends=('python2-simplejson')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=('https://pypi.python.org/packages/09/9b/21a1d63160166e58a4b2e24f068c1bf9bfb3610f389d39cd5e96910b4f47/jsonstreams-0.4.1.tar.gz'
        'https://pypi.python.org/packages/09/9b/21a1d63160166e58a4b2e24f068c1bf9bfb3610f389d39cd5e96910b4f47/jsonstreams-0.4.1.tar.gz.asc'
        'https://raw.githubusercontent.com/dcbaker/jsonstreams/master/LICENSE')
sha256sums=('875c03c0a93e1e23a7eaa7a7a89e36290ff29613286bce563dad37fb7061addd'
            'SKIP'
            '8b1cc8af45b502fd5bfce434721cb0d9a833298f05fe983ebc6c7f36d06fab59')
validpgpkeys=('5303CCAA8FFEE5A1472F3538089E1696140688EF')  # Dylan Baker <dylan@pnwbakers.com>

prepare() {
  cp LICENSE "$srcdir/${_name}-$pkgver"/
}

package() {
  cd "$srcdir/${_name}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
