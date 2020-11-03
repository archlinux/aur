# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname=pyidm
pkgver=2020.10.28
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
b2sums=('2e4eb2411b35bd0f67cfb12953037baa7b41d3a8311f87136aa7e27fba9aa7546a4b3921c8fa92933a6970092527eaec2f3efbe817b8bcc2f92352c3dcef20e4')

build() {
  cd "$srcdir/PyIDM-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/PyIDM-$pkgver"

  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
