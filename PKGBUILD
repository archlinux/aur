# Contributor: Leonardo Ferreira Fontenelle <leonardof@gnome.org>
pkgname=classix
pkgver=0.3.1
pkgrel=1
pkgdesc="ICD-10 lookup application"
arch=('any')
url="http://code.google.com/p/classix/"
license=('GPL')
#groups=()
depends=('python2>=2.5' 'sqlite3' 'pygtk>=2.10' 'pygobject>=2.12')
#makedepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#install=
source=("http://classix.googlecode.com/files/$pkgname-$pkgver.tar.gz")
#noextract=()
md5sums=('0b372d7bd85d19e10a5c60af492adf64') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export PYTHON="$(which python2)"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/usr" install
}

