# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: Victor Häggqvist <aur@snilius.com>

pkgname=rainbowstream
pkgver=1.3.7
pkgrel=2
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
'python-pysocks-git'
'python-pocket')
makedepends=('python-setuptools')
provides=('rainbowstream')
conflicts=('rainbowstream')
source=(
https://pypi.python.org/packages/b6/2b/37822d04aca421be670cd3a4bdfb4221bd742786f72a242baa5686bc76c7/rainbowstream-${pkgver}.tar.gz
setup.py.patch)
sha512sums=('252e4dd402845b6ff4334c2df76a36f48cc483f0645e9201f8e62b219765bf7007cb9070fb16f367a311ad080470f800bfb892ecf6c2b4565ff78870fbb2dcac'
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
