# Maintainer: Victor Häggqvist <aur@snilius.com>

pkgname=rainbowstream
pkgver=1.3.1
pkgrel=1
pkgdesc="A smart and nice Twitter client on terminal written in Python"
url="http://www.rainbowstream.org/"
license=('MIT')
arch=('any')
depends=(
'python'
'python-dateutil'
'python-arrow'
'python-requests'
'python-pyfiglet'
'python-twitter'
'python-pillow'
'python-pysocks-git')
makedepends=('python-setuptools')
provides=('rainbowstream')
conflicts=('rainbowstream')
source=(
https://pypi.python.org/packages/source/r/rainbowstream/rainbowstream-${pkgver}.tar.gz
setup.py.patch)
sha512sums=('b549832ab538687e3ea37974b828737b3c5a360e10593bb1ff65a26ff77d4f6615e16db2e1498eca4e6cf23e011ce28ab32c0724f857ed8a8fdb218418026d2f'
            'd5203f37697dbff3fe745fa4a0236dd22f5565c833e3dd17e3c762706ab8b2758e6b56d2147e021c7ccb370f1bc97fb42cae602a3fc31213af03b1482fca5a9b')

build() {
  cd "$srcdir/rainbowstream-${pkgver}"
  patch -i ../setup.py.patch
  python setup.py build
}

package() {
  cd "$srcdir/rainbowstream-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim: ts=2 sts=2 sw=2 et ft=sh
