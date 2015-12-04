# Maintainer: Dave Blair <mail@dave-blair.de>
# Contributor: 
# Contributor: 

pkgname='umplayer'
pkgver='0.95'
pkgrel='1'
pkgdesc='An alternative to SMPlayer'
arch=('i686' 'x86_64')
url='http://www.umplayer.com/'
license=('GPL')
depends=('qt4' 
	 'hicolor-icon-theme')
install=${pkgname}.install
# optdepends=('')
# makedepends=('')

if [[ $CARCH = x86_64 ]]; then
  source=("http://sourceforge.net/projects/umplayer/files/UMPlayer-0.95/xUbuntu_11.04/${pkgname}_${pkgver}_amd64.deb")
  md5sums=('fad31c6fe6ae3f2f010e01710131da0b')
else
  source=("http://sourceforge.net/projects/umplayer/files/UMPlayer-0.95/xUbuntu_11.04/${pkgname}_${pkgver}_i386.deb")
  md5sums=('821f6b8136f8fb7ac450b897358cada9')
fi

build() {
  cd ${srcdir}
  bsdtar -xf data.tar.gz -C .
}

package() {
  cd ${srcdir}
  mv usr ${pkgdir}
}
