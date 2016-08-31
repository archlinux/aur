# Maintainer: Dylan Baker <dylan@pnwbakers.com>
_name=jsonstreams
pkgname=python-${_name}
pkgver=0.4.0
pkgrel=1
pkgdesc="A Python module for writing JSON as a stream"
arch=('any')
url="https://github.com/dcbaker/jsonstreams"
license=('MIT')
depends=()
makedepends=('python-setuptools')
optdepends=('python-simplejson')
options=(!emptydirs)
source=('https://pypi.python.org/packages/ef/8f/cf15b93b5acb3954df09cc4acbeb45d9e9be38149b3976bfffb06fabce45/jsonstreams-0.4.0.tar.gz'
        'https://pypi.python.org/packages/ef/8f/cf15b93b5acb3954df09cc4acbeb45d9e9be38149b3976bfffb06fabce45/jsonstreams-0.4.0.tar.gz.asc'
        'https://raw.githubusercontent.com/dcbaker/jsonstreams/master/LICENSE')
sha256sums=('ee55dbbf8e7527c526a78e4db039ad4cdebb9e058347f515ae7e08eae6338f67'
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
