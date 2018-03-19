# Maintainer: darehanl <darehanl@150mail.com>

pkgname=ttf-nanum
pkgver=2017
pkgrel=2
pkgdesc="Nanum series TrueType fonts"
arch=('any')
url="http://hangeul.naver.com/"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('p7zip')
_filename=NanumFontSetup_TTF_ALL_totalsearch.exe
source=("http://appdown.naver.com/naver/font/NanumFont/setup/$_filename")
sha256sums=('63cbbe0fef0a509bed8031976b30a0fa30d1a49c41a0942ea436db9ccec6a849')

build() {
  cd "$srcdir"
  7z x -y "$_filename" "\$WINDIR/Fonts"
}

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 "${srcdir}/\$WINDIR/Fonts"/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
}

