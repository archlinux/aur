# $Id: PKGBUILD 175095 2013-01-13 15:03:29Z foutrelis $
# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com> 
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=ttf-dejavu-snapshot
pkgver=2.35+20150518+2601
pkgrel=1
pkgdesc="Font family based on the Bitstream Vera Fonts with a wider range of characters (development snapshot)"
arch=('any')
url="http://dejavu-fonts.org/wiki/Main_Page"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontscale' 'xorg-mkfontdir')
provides=('ttf-font' 'ttf-dejavu')
conflicts=('ttf-dejavu')
install=ttf-dejavu.install
source=(http://dejavu.sourceforge.net/snapshots/dejavu-fonts-ttf-${pkgver//+/-}.tar.bz2)
md5sums=('0380bc2e26fab356ea16d9c9ebdba7cd')

package() {
  install -dm755 "${pkgdir}"/etc/fonts/conf.avail
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF

  cd "${srcdir}"/dejavu-fonts-ttf-${pkgver//+/-}
  install -m644 ttf/*.ttf "${pkgdir}"/usr/share/fonts/TTF/
  install -m644 fontconfig/*.conf "${pkgdir}"/etc/fonts/conf.avail/

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
