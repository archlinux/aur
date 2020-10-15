# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname=pyidm
pkgver=2020.10.11
pkgrel=1
pkgdesc="Python open source alternative to IDM (Internet Download Manager)"
arch=('any')
url="https://github.com/pyIDM/PyIDM"
license=('LGPL3')
depends=('ffmpeg'
         'python>=3.6' 
         'python-awesometkinter'
         'python-certifi' 
         'python-pillow'
         'python-plyer' 
         'python-pycurl' 
         'python-pystray'
         'youtube-dl')
makedepends=('python-setuptools')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyIDM/PyIDM/archive/$pkgver.tar.gz")
b2sums=('f5919ef413d647c4d1ff0e82167960ea03c059b0f85e82cb3c7ed7b889b541d1be585383529ed6dd8ef92a8b3ad4f1ea3448ef61f73df748d309665aea3a3594')

build() {
  cd "$srcdir/PyIDM-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/PyIDM-$pkgver"

  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
