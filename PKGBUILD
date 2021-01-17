# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname=pyidm
pkgver=2021.1.7
pkgrel=1
pkgdesc="Python open source alternative to IDM (Internet Download Manager)"
arch=('any')
url="https://github.com/pyIDM/PyIDM"
license=('LGPL3')
depends=('ffmpeg'
         'python>=3.6' 
         'python-awesometkinter>=2020.12.16'
         'python-certifi'
         'python-packaging'
         'python-pillow>=6.0.0'
         'python-plyer'
         'python-pycurl'
         'python-pystray'
         'youtube-dl'
         'youtube-dlc')
makedepends=('python-setuptools')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyIDM/PyIDM/archive/2021.1.7.tar.gz")
b2sums=('0052bfdad452f9834daedfce8738396f928362d88e522d86c1a098ebea182c68511c7d71548a8e49cf6545365d221787f80ce73ca797eefb5e18b2864c9d8a8b')

build() {
  cd "$srcdir/PyIDM-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/PyIDM-$pkgver"

  python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
