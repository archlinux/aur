# Maintainer: Victor Häggqvist <aur@snilius.com>

pkgname=rainbowstream
pkgver=1.3.0
pkgrel=1
pkgdesc="A smart and nice Twitter client on terminal written in Python"
url="http://www.rainbowstream.org/"
license=('MIT')
arch=('any')
depends=(
'python'
'python-dateutil'
'python-arrow-git'
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
sha512sums=('c1f69e6be121cafa49e39f98724d9a118b5967fdde4438ed305f2cb2ba1c5067786cbf4cb3e7146d7e3a42da0428997ca849b6280ef72e5c1b11e9958e0c660c'
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
