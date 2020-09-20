# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

pkgname=python-awesometkinter
pkgver=2020.9.18
pkgrel=2
pkgdesc="Pretty tkinter widgets"
arch=('any')
url='https://github.com/Aboghazala/AwesomeTkinter'
license=('MIT')
depends=('python' 'tk' 'python-pillow')
source=("https://github.com/Aboghazala/AwesomeTkinter/archive/$pkgver.tar.gz"
        "$pkgname.license")
b2sums=('0b4f8e4b1581c5bbfead9b90d86cee0fe750643e09277099a70d0a094fd385c39d43b200f2d9d837d39721f39b395eeffa43036ce0ad716e7c2c13c54da250df'
        'c14d9f8f71d788a2f4776128973b6fcff244f55a3b5fb9410404e3d04f7c8f81316fc69622f3f2ada4c23eabbd2194ad2d4bca4ab6e8733625b4328c7aaa8456')

build() {
  cd "AwesomeTkinter-$pkgver"
  python setup.py build
}

package() {
  install -Dm644 "$pkgname.license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "AwesomeTkinter-$pkgver"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
