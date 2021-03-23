# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

pkgname=python-awesometkinter
pkgver=2020.3.19
pkgrel=1
pkgdesc="Pretty tkinter widgets"
arch=('any')
url='https://github.com/Aboghazala/AwesomeTkinter'
license=('MIT')
depends=('python' 'tk' 'python-pillow')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Aboghazala/AwesomeTkinter/tarball/244a693ddfd3fa61374ff89fcd25ba8aad50a0de")
b2sums=('7ffad28459d74d4b960ffddf3f910b12e12234e4a0f12239ef77c1fa7d9e3d8e653bec81250d3ff6a4f0930ec7204f3e63dbe780df5ae77456af7aed7c0b4cb5')

build() {
  cd Aboghazala-AwesomeTkinter-244a693
  python setup.py build
}

package() {
  cd Aboghazala-AwesomeTkinter-244a693
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
