# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname=firedm
pkgver=2021.3.23
pkgrel=2
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
b2sums=('af994d8d521b654eab78ec3b8c2c8479a4305aa7b3322201732903e50fe604fca7408ff8a362810586d2a9f20650fe51ac9a9ce40f6dc6db3d114fdf367224f9')

build() {
  cd "$srcdir/FireDM-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/FireDM-$pkgver"

  python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
