# Maintainer: LightDot <lightdot -a-t- g m a i l>

_fnt_name=league-mono
pkgname=ttf-${_fnt_name}
pkgver=20171115
pkgrel=1
pkgdesc="A mashup of sorts, inspired by some beautiful forms found in both Fira Mono, Libertinus Mono, and Courier."
arch=('any')
url="http://theleagueofmoveabletype.com/${_fnt_name}"
license=('custom:OFL')
groups=('lmt-fonts')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/${_fnt_name}/archive/master.zip")
md5sums=('0e9214b72309aa04cfee76f5f8bb76cb')

package() {
  install -d ${pkgdir}/usr/share/fonts/OTF
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -Dm644 ${srcdir}/${_fnt_name}-master/otf/*.otf  ${pkgdir}/usr/share/fonts/OTF/
  install -Dm644 ${srcdir}/${_fnt_name}-master/ttf/*.ttf  ${pkgdir}/usr/share/fonts/TTF/

  install -Dm644 ${srcdir}/${_fnt_name}-master/ofl.markdown ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
