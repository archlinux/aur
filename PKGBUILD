# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=sniglet
pkgname=ttf-${_fnt_name}
pkgver=20160215
pkgrel=2
pkgdesc="A fun rounded display face that’s great for headlines."
arch=('any')
url="http://theleagueofmoveabletype.com/${_fnt_name}"
license=('custom:OFL')
groups=('lmt-fonts')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('ttf-impallari-sniglet')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/${_fnt_name}/archive/master.zip")
md5sums=('f649d483683a4f5de8051dc23fe7ac2c')

package() {
  install -d ${pkgdir}/usr/share/fonts/OTF
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -Dm644 ${srcdir}/${_fnt_name}-master/*.otf  ${pkgdir}/usr/share/fonts/OTF/
  install -Dm644 ${srcdir}/${_fnt_name}-master/*.ttf  ${pkgdir}/usr/share/fonts/TTF/

  install -Dm644 ${srcdir}/${_fnt_name}-master/Open\ Font\ License.markdown ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
