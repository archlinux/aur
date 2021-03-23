# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname=firedm
pkgver=2021.3.23
pkgrel=1
pkgdesc="Python open source alternative to IDM (Internet Download Manager)"
arch=('any')
url='https://github.com/firedm/FireDM'
license=('LGPL3')
depends=('ffmpeg'
         'python>=3.6' 
         'python-awesometkinter>=2021.3.19'
         'python-certifi'
         'python-packaging'
         'python-pillow>=6.0.0'
         'python-plyer'
         'python-pycurl'
         'python-pystray'
         'youtube-dl'
         'youtube-dlp')
makedepends=('python-setuptools')
changelog=$pkgname.changelog
replaces=('pyidm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/firedm/FireDM/archive/$pkgver.tar.gz")
b2sums=('2ace3f4ce7de0333bb12c71588fb3273bdc213f3ab2e82eb785e73867364eb22b79696c401b8b49ebfc70529f64d2dac09e910579753c3634b7eaea17275d627')

build() {
  ls
  cd "$srcdir/FireDM-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/FireDM-$pkgver"

  python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
