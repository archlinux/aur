# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>

pkgname=python-awesometkinter
pkgver=2021.10.12
pkgrel=1
pkgdesc="Pretty tkinter widgets"
arch=('any')
url='https://github.com/Aboghazala/AwesomeTkinter'
license=('MIT')
depends=('python' 'tk' 'python-pillow' 'python-bidi')
makedepends=('python-setuptools')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Aboghazala/AwesomeTkinter/archive/refs/tags/$pkgver.tar.gz")
b2sums=('96c4fa47a9c090f2819dcdc4acb14ba444c4dea30be0aacfd8d3081cf12afc5796372a00a35319c9504c6fce9a9e149e5bed83da8e8d2f25af8fe3883a84efe4')

build() {
  cd "AwesomeTkinter-$pkgver"
  python setup.py build
}

package() {
  cd "AwesomeTkinter-$pkgver"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
