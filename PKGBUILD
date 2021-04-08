# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

pkgname=python-awesometkinter
pkgver=2021.4.2
pkgrel=1
pkgdesc="Pretty tkinter widgets"
arch=('any')
url='https://github.com/Aboghazala/AwesomeTkinter'
license=('MIT')
depends=('python' 'tk' 'python-pillow')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Aboghazala/AwesomeTkinter/tarball/3a70dcae937ccab6a53eb81af0cffa5ceeab6da4")
b2sums=('13fec5c54b8ecbdcba4cb98aa3488a0beacc789c64b25579276264edd3f9b7dc492ca9db67d3f1d6c892bd9fe372aeea46b5ca7153d31b5a1d500297d4232a25')

build() {
  cd Aboghazala-AwesomeTkinter-3a70dca
  python setup.py build
}

package() {
  cd Aboghazala-AwesomeTkinter-3a70dca
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
