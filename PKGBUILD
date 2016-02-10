# Maintainer: Victor Häggqvist <aur@snilius.com>

pkgname=rainbowstream
pkgver=1.3.2
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
sha512sums=('7a6251aa91d0d4cfecedb688b8c3a1b34d7eaab0d6f42bfe2d8ed1f9b6ca7f60ca290d8343c5205c008cb10ddfc22cc85669876e851c3c1c8eda1c695721c435'
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
