# Maintainer: darehanl <darehanl@150mail.com>

pkgname=ttf-nanum
pkgver=2017
pkgrel=1
pkgdesc="Nanum series TrueType fonts"
arch=('any')
url="http://hangeul.naver.com/"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('p7zip')
install=ttf.install
_filename=NanumFontSetup_TTF_ALL_totalsearch.exe
source=("http://appdown.naver.com/naver/font/NanumFont/setup/$_filename")
md5sums=('1de7736a48dfaed5eb70ca2c4ce315b9')

build() {
  cd $srcdir
  7z x -y $_filename "\$WINDIR/Fonts"
}

package() {
  cd $pkgdir

  install -d -m 755 usr/share/fonts/TTF || return 1
  install -m 644 ${srcdir}/\$WINDIR/Fonts/*.ttf usr/share/fonts/TTF/ || return 1
}

