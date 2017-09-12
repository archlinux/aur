# Contributor: Aashik S  ashik at inflo dot ws
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-keraleeyam
pkgver=2.0.0+20170909
pkgrel=1
pkgdesc="This is Keraleeyam, a font belonging to a set of TrueType and OpenType fonts released under 
the 
GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
depends=(fontconfig xorg-font-utils)
source=("http://smc.org.in/downloads/fonts/keraleeyam/Keraleeyam.ttf"
        "https://gitlab.com/smc/keraleeyam/raw/master/67-smc-keraleeyam.conf")
md5sums=('8d2093968e3fca2ec879a87e1c145d8a'
         '37d7da81268fa7cf4a9702d241c7ea1c')
install=ttf-malayalam-fonts.install


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF" 
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
