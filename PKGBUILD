# Maintainer: Dave Blair <mail@dave-blair.de>
# Contributor: 
# Contributor: 

pkgname='minitube-aur'
pkgver='2.6'
pkgrel='1'
pkgdesc='A youtube client that does not need flash'
conflicts=('minitube')
arch=('i686' 'x86_64')
url='http://flavio.tordini.org/minitube'
license=('gpl3')
install=${pkgname}.install
depends=('phonon-qt5' 
	 'qt5-script' 
	 'hicolor-icon-theme')
if [[ $CARCH = 'i686' ]]; then
  source=("http://flavio.tordini.org/files/minitube/minitube.deb")
else
  source=("http://flavio.tordini.org/files/minitube/minitube64.deb")
fi
md5sums=('SKIP')

prepare() {
  cd "$srcdir"
  msg2 'Extracting data from debian package'
  bsdtar -xf data.tar.xz -C .
}

package() {
  cd "$srcdir"
  msg2 "Packaging..."
  mv usr ${pkgdir/usr}  
}
