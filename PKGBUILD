# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

pkgname=python-awesometkinter
pkgver=2020.1.7
pkgrel=1
pkgdesc="Pretty tkinter widgets"
arch=('any')
url='https://github.com/Aboghazala/AwesomeTkinter'
license=('MIT')
depends=('python' 'tk' 'python-pillow')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Aboghazala/AwesomeTkinter/tarball/c7163579c98881edee5285e0521522856128f9f0")
b2sums=('714e2431aa006c36f414f3f986786b11820bf1c84027273c32657354c4a60696362a9a430190b08e83de4a9cb215ee154b268bbba8ff2d8a8e3c483aa5c18c6c')

build() {
  cd Aboghazala-AwesomeTkinter-c716357
  python setup.py build
}

package() {
  cd Aboghazala-AwesomeTkinter-c716357
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
