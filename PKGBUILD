# Maintainer: Victor Häggqvist <aur@snilius.com>

pkgname=rainbowstream
pkgver=1.3.3
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
sha512sums=('d8250eef283e835431e3635a53cae83feddf1f9684e4bd2c6f3fd2bc447495ca43223f479336077a438a1011d1ca51aa1cb0f056654bb5fd00a796ed315612c7'
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
