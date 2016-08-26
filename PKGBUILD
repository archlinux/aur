# Maintainer: Dylan Baker <dylan@pnwbakers.com>
_name=jsonstreams
pkgname=python2-${_name}
pkgver=0.3.2
pkgrel=1
pkgdesc="A Python module for writing JSON as a stream"
arch=('any')
url="https://github.com/dcbaker/jsonstreams"
license=('MIT')
depends=()
optdepends=('python2-simplejson')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=('https://pypi.python.org/packages/28/57/d70adaa037212b48cb06c58055fafae94e482fed50f7ba5addc053ee9588/jsonstreams-0.3.2.tar.gz'
        'https://pypi.python.org/packages/28/57/d70adaa037212b48cb06c58055fafae94e482fed50f7ba5addc053ee9588/jsonstreams-0.3.2.tar.gz.asc'
        'https://raw.githubusercontent.com/dcbaker/jsonstreams/master/LICENSE')
sha256sums=('7d7802cc23509d1d129d640e591651f979defc74da69cb8577c6dbcf26b5a5e5'
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
