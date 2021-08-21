# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=nanodlna
pkgname=python-$_pkgname
pkgver=0.2.1
pkgrel=1
pkgdesc="Command line tool to play local video files in your TV (or any other UPnP/DLNA compatible device)"
arch=('any')
url="https://github.com/gabrielmagno/nano-dlna"
license=('MIT')
depends=('python'
         'python-twisted')
source=("https://files.pythonhosted.org/packages/40/20/19950384c6de1ebf07b68c33e52fd8ac4f0b249d6d607717d3f0c9a2021c/$_pkgname-$pkgver.tar.gz")
md5sums=('1ca3d0b477034e1530a05e609ea9b0c3')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
