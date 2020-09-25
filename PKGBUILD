# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

pkgname=python-awesometkinter
pkgver=2020.9.22
pkgrel=1
pkgdesc="Pretty tkinter widgets"
arch=('any')
url='https://github.com/Aboghazala/AwesomeTkinter'
license=('MIT')
depends=('python' 'tk' 'python-pillow')
changelog="$pkgname.changelog"
source=("https://github.com/Aboghazala/AwesomeTkinter/archive/$pkgver.tar.gz")
b2sums=('6a090e92fc7e4f87224230c574da6bdaaf011d757ca96eceead3af5709fad8a53e4ba4345b883264311573416d72162f65e5a5e3a048c33653b0cc17cb3a0a7c')

build() {
  cd "AwesomeTkinter-$pkgver"
  python setup.py build
}

package() {
  cd "AwesomeTkinter-$pkgver"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
