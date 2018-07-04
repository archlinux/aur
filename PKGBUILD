# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=xcursor-thedot
pkgver=0.5
pkgrel=1
pkgdesc="A mouse theme with circles (fork of the unmaintained original)"
arch=('any')
url="https://www.gnome-look.org/p/1244392/"
license=('GPL')
depends=()
source=("https://bitbucket.org/sergiy_ilchuk/thedot/get/${pkgver}.tar.bz2"
	"thedot.patch")
md5sums=('854eb43fb3e4d835639d35ab3a91ec16'
         'b0b7d259448ac0ee8ce2d18c8d49eec9')

prepare() {
cd ${srcdir}/sergiy_ilchuk-thedot-ff9eeee74e32/
patch -Np1 -i ../thedot.patch
}

package() {
cd ${srcdir}/sergiy_ilchuk-thedot-ff9eeee74e32/

# Install
install -dm755 ${pkgdir}/usr/share/icons/
cp -vR Dot-{Dark,Light} ${pkgdir}/usr/share/icons/
}
