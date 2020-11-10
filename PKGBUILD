# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname=pyidm
pkgver=2020.11.10
pkgrel=1
pkgdesc="Python open source alternative to IDM (Internet Download Manager)"
arch=('any')
url="https://github.com/pyIDM/PyIDM"
license=('LGPL3')
depends=('ffmpeg'
         'python>=3.6' 
         'python-awesometkinter>=2020.9.22'
         'python-certifi' 
         'python-pillow'
         'python-plyer' 
         'python-pycurl' 
         'python-pystray'
         'youtube-dl')
makedepends=('python-setuptools')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyIDM/PyIDM/archive/$pkgver.tar.gz")
b2sums=('25af00984a84f69c6967debebea40fbb453157e6dbc5fd4ea6c834aed2f8225b4bb443a65b4118bd2b22a6128308db49b4f9d7f84377b4363e47fa2099a31733')

build() {
  cd "$srcdir/PyIDM-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/PyIDM-$pkgver"

  python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
