# Maintainer: maz-1 <ohmygod19993 at gmail>
pkgname=python-pygubu
pkgver=0.9.7.7
pkgrel=1
pkgdesc="A simple GUI designer for the python tkinter module"
url="https://github.com/alejandroautalan/pygubu"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python' 'tk' 'python-appdirs')
source=("https://github.com/alejandroautalan/pygubu/archive/v${pkgver}.tar.gz"
        "tk-logo.svg"
        "pygubu.desktop")
md5sums=('cb2e83f926c0126b097089ca96a1d29a'
         'f60d13e5f87d15d764276387fc4627c2'
         'f19d0ac224dae3a71c26e66a970925b1')

build() {
  cd "$srcdir/pygubu-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/pygubu-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$srcdir/tk-logo.svg" "$pkgdir/usr/share/icons/pygubu.svg"
  install -Dm755 "$srcdir/pygubu.desktop" "$pkgdir/usr/share/applications/pygubu.desktop"
}
