# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

pkgname=python-awesometkinter
pkgver=2021.5.23
pkgrel=1
pkgdesc="Pretty tkinter widgets"
arch=('any')
url='https://github.com/Aboghazala/AwesomeTkinter'
license=('MIT')
depends=('python' 'tk' 'python-pillow')
makedepends=('python-setuptools')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Aboghazala/AwesomeTkinter/tarball/e0ff474ecd44f9a192452f821da222f18c1745b6")
b2sums=('9fe38d2be8a5f670210d47b5e479c82a15f488e31ba4c65719c3c1f1fe7144d443fa2137e797f063ab3b666c4d76ccc35fce3e6c0e5d9b5b2abcf89ba3a7436e')

build() {
  cd Aboghazala-AwesomeTkinter-e0ff474
  python setup.py build
}

package() {
  cd Aboghazala-AwesomeTkinter-e0ff474
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
