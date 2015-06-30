# Contributor: Guillaume ALAUX <Guillaume at ALAUX dot net>
# Maintainer: Jose Riha < jose 1711 gmail com >

pkgname=scrabble3d
pkgver=3.1.2_1
pkgrel=1
pkgdesc="Highly customizable Scrabble game (classic, SuperScrabble, 3D games)"
depends=(gtk2)
arch=('i686' 'x86_64')
if [ "${CARCH}" = 'i686' ]
	then
	_arch=i386
	else
	_arch=x86_64
fi
url="http://scrabble.game-server.cc/wiki"
license=('GPL')

source=(http://downloads.sourceforge.net/project/scrabble/Main_Program/Linux/Scrabble3D-${_arch}.deb)

if [  "${CARCH}" = 'i686' ]; then
md5sums=('1c6c864ec1f9d26abd08c04af3d5a811')
else
md5sums=('1591c94eb804b61d5f502cfa58dc0859')
fi

package() {
  cd "${srcdir}"

  ar x Scrabble3D-*.deb
  tar xf data.tar.gz -C ${pkgdir}
  chmod -R 755 ${pkgdir}/usr
}
