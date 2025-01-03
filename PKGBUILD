# Maintainer: Stuart Cardall <developer at it-offshore.co.uk>
pkgname=pygubu-designer
pkgver=0.39.3
pkgrel=1
pkgdesc="A simple GUI designer for the python tkinter module"
url="https://github.com/alejandroautalan/pygubu-designer"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('python-pygubu')
depends=('python' 'python-mako' 'python-black' 'python-screeninfo' 'tk' 'python-appdirs')
source=("${pkgname}-${pkgver}::https://github.com/alejandroautalan/${pkgname}/archive/v${pkgver}.tar.gz"
        "tk-logo.svg"
        "pygubu-designer.desktop")
md5sums=('42591d6a0cdcdfc94b9e62a47121b921'
         'f60d13e5f87d15d764276387fc4627c2'
         'e745be7853e0343ff34e97d17607ec18')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python3 -m pip install . --prefix=/usr --root="$pkgdir"
  install -Dm755 "$srcdir/tk-logo.svg" "$pkgdir/usr/share/icons/pygubu.svg"
  install -Dm755 "$srcdir/pygubu-designer.desktop" "$pkgdir/usr/share/applications/pygubu-designer.desktop"
}
