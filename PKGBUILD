# Maintainer: Stuart Cardall <developer at it-offshore.co.uk>
pkgname=pygubu-designer
pkgver=0.29
pkgrel=0
pkgdesc="A simple GUI designer for the python tkinter module"
url="https://github.com/alejandroautalan/pygubu-designer"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python' 'python-pygubu' 'python-mako' 'python-black' 'python-screeninfo' 'tk' 'python-appdirs')
source=("${pkgname}-${pkgver}::https://github.com/alejandroautalan/${pkgname}/archive/v$pkgver.tar.gz"
        "tk-logo.svg"
        "pygubu-designer.desktop")
md5sums=('95a8f7abe6ae1e7fa34e8f9bc9adc521'
         'f60d13e5f87d15d764276387fc4627c2'
         'e745be7853e0343ff34e97d17607ec18')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$srcdir/tk-logo.svg" "$pkgdir/usr/share/icons/pygubu.svg"
  install -Dm755 "$srcdir/pygubu-designer.desktop" "$pkgdir/usr/share/applications/pygubu-designer.desktop"
}
