# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

pkgname=python-awesometkinter
pkgver=2020.12.16
pkgrel=1
pkgdesc="Pretty tkinter widgets"
arch=('any')
url='https://github.com/Aboghazala/AwesomeTkinter'
license=('MIT')
depends=('python' 'tk' 'python-pillow')
changelog="$pkgname.changelog"
source=("https://github.com/Aboghazala/AwesomeTkinter/tarball/cf562880fc572977f9805779b11f437da2ce09ff")
b2sums=('f6a82c95cd740cc6358b7bf3f669874959fc0a585dbc1c07717d8433c756603125537c8498cf70f7881fc66e07fd049ce5caa20a7d1428c0afcb9e360cd23e5b')

build() {
  cd Aboghazala-AwesomeTkinter-cf56288
  python setup.py build
}

package() {
  cd Aboghazala-AwesomeTkinter-cf56288
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
