# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=nanodlna
pkgname=python-$_pkgname
pkgver=0.3.0
pkgrel=1
pkgdesc="Command line tool to play local video files in your TV (or any other UPnP/DLNA compatible device)"
arch=('any')
url="https://github.com/gabrielmagno/nano-dlna"
license=('MIT')
depends=('python'
         'python-twisted')
source=("https://files.pythonhosted.org/packages/f9/81/3929890cf08c2e8614e612494bc90f12bc5e6c95a704f526253fdcc8a85d/$_pkgname-$pkgver.tar.gz")
sha256sums=('f8dbaf21d6ccfe205a11a411f2778006de0da36ab90dd48bb478ba6ec1eb0b56')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
