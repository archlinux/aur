# Maintainer: Dave Blair <mail@dave-blair.de>
# Contributor: alicavus
# Contributor:

pkgname='minitube-aur'
pkgver=3.5
pkgrel=1
pkgdesc='A youtube client that does not need flash'
conflicts=('minitube')
arch=('x86_64')
url='https://flavio.tordini.org/minitube'
license=('gpl3')
install=${pkgname}.install
depends=('phonon-qt5'
         'qt5-declarative'
         'mpv'
         'hicolor-icon-theme')
source=("https://flavio.tordini.org/files/minitube/minitube.deb")
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

