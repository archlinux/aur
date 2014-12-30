# Maintainer: Maurizio D'Addona <mauritiusdadd@libero.it>

pkgname=lxnstack
pkgver=1.4.4
pkgrel=3
pkgdesc="A program usefull to align and stack astronomical images"
arch=(any)
url="http://sourceforge.net/p/lxnstack/wiki/Home/"
license=('GPL3')
provides=('lxnstack')
conflicts=('lxnstack')
depends=('python2-scipy' 'python2-pyqt4' 'opencv' 'python2-pillow' 'v4l-utils')
optdepends=('python2-astropy: to read/write FITS file')
options=(docs)
install="$pkgname.install"

source=("http://master.dl.sourceforge.net/project/lxnstack/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('d8eec139b3b9006e82b6e78fb18b47ce255155a6022245225a64507ee9b49675')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir "$pkgdir/usr"
  python2 ./install.py --prefix="$pkgdir/usr" --ignore-prefix
}

