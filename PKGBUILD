# Maintainer: Stuart Cardall <developer at it-offshore.co.uk>
pkgname=pygubu-designer
pkgver=0.30
pkgrel=0
pkgdesc="A simple GUI designer for the python tkinter module"
url="https://github.com/alejandroautalan/pygubu-designer"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('python-pygubu')
depends=('python' 'python-pygubu' 'python-mako' 'python-black' 'python-screeninfo' 'tk' 'python-appdirs')
source=("${pkgname}-${pkgver}::https://github.com/alejandroautalan/${pkgname}/archive/v${pkgver}.tar.gz"
        "tk-logo.svg"
        "pygubu-designer.desktop")
md5sums=('191a9f1f3a8ccc3e9778d695e12df14e'
         'f60d13e5f87d15d764276387fc4627c2'
         'e745be7853e0343ff34e97d17607ec18')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python3 -m pip install . --prefix=/usr --root="$pkgdir"
  install -Dm755 "$srcdir/tk-logo.svg" "$pkgdir/usr/share/icons/pygubu.svg"
  install -Dm755 "$srcdir/pygubu-designer.desktop" "$pkgdir/usr/share/applications/pygubu-designer.desktop"
}
