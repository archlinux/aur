# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>

pkgname=python-awesometkinter
pkgver=2021.6.4
pkgrel=1
pkgdesc="Pretty tkinter widgets"
arch=('any')
url='https://github.com/Aboghazala/AwesomeTkinter'
license=('MIT')
depends=('python' 'tk' 'python-pillow')
makedepends=('python-setuptools')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Aboghazala/AwesomeTkinter/tarball/ecbd05f4227679af856cbf724e7dc879fba76262")
b2sums=('da894c4f86502cf1baf66057a2b1fd5d631a92350141711cc8e4526045b769dd4e0cd3e6e6ef371eab05af0e86ff8b8c4bd0987b7a3fcb4924ebcffed297faa8')

build() {
  cd Aboghazala-AwesomeTkinter-ecbd05f
  python setup.py build
}

package() {
  cd Aboghazala-AwesomeTkinter-ecbd05f
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
