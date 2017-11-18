# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-manjari
pkgver=1.3+20171118
pkgrel=1
pkgdesc="This is Manjari, a font belonging to a set of TrueType and OpenType fonts released under the 
SIL OPEN FONT LICENSE Version 1.1 - 26 February 2007 for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
depends=(fontconfig xorg-font-utils)
source=(
"https://smc.org.in/downloads/fonts/manjari/Manjari-Regular.ttf"
"https://smc.org.in/downloads/fonts/manjari/Manjari-Thin.ttf"
"https://smc.org.in/downloads/fonts/manjari/Manjari-Bold.ttf"
"67-smc-manjari.conf"
)
md5sums=('46983ef31edebd55cdb9c0a6717dbe52'
         'c288145fe5f3a12dfd7ff2171abbd755'
         '16e75686cfcd2da61a047dcde1ed11b2'
         '98923c2e7c4df841f7e8ee0f3e05f9f5')
install=ttf-malayalam-fonts.install
package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF" 
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
