# Contributor: Sunjae Park <darehanl@gmail.com>

pkgname=ttf-nanum
pkgver=3.1
pkgrel=3
pkgdesc="Nanum series TrueType fonts"
arch=('any')
url="http://hangul.naver.com"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
makdepends=('p7zip')
install=ttf.install
source=('http://appdown.naver.com/naver/font/NanumFont/setup/NanumFontSetup_TTF_ALL_hangeulcamp.exe')
md5sums=('539c778ddbc8cf518f353e1ab1d4afda')


build() {
  cd $srcdir
  7z x NanumFontSetup_TTF_ALL_hangeulcamp.exe "\$WINDIR/Fonts"
}

package() {
  cd $pkgdir

  install -d -m 755 usr/share/fonts/TTF || return 1
  install -m 644 ${srcdir}/\$WINDIR/Fonts/*.ttf usr/share/fonts/TTF/ || return 1
}

