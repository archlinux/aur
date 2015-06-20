# Contributor: Leonardo Ferreira Fontenelle <leonardof@gnome.org>
pkgname=classix
pkgver=0.3.1
pkgrel=2
pkgdesc="ICD-10 lookup application"
arch=('any')
url="http://code.google.com/p/classix/"
license=('GPL')
depends=('python2>=2.5' 'sqlite>=3' 'sqlite<4' 'pygtk>=2.10' 'python2-gobject2>=2.12' 'desktop-file-utils')
source=("http://classix.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('0b372d7bd85d19e10a5c60af492adf64')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export PYTHON="$(which python2)"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

