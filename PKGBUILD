# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

pkgname=python-awesometkinter
pkgver=2020.9.18
pkgrel=3
pkgdesc="Pretty tkinter widgets"
arch=('any')
url='https://github.com/Aboghazala/AwesomeTkinter'
license=('MIT')
depends=('python' 'tk' 'python-pillow')
changelog="$pkgname.changelog"
source=("https://github.com/Aboghazala/AwesomeTkinter/archive/$pkgver.tar.gz")
b2sums=('0b4f8e4b1581c5bbfead9b90d86cee0fe750643e09277099a70d0a094fd385c39d43b200f2d9d837d39721f39b395eeffa43036ce0ad716e7c2c13c54da250df')

build() {
  cd "AwesomeTkinter-$pkgver"
  python setup.py build
}

package() {
  cd "AwesomeTkinter-$pkgver"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
