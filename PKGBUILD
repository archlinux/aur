# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-dyuthi
pkgver=3.0.0+20200101
pkgrel=1
pkgdesc="This is Dyuthi, a font belonging to a set of TrueType and OpenType fonts released under the 
GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
depends=(fontconfig xorg-font-utils)
source=("https://smc.org.in/downloads/fonts/dyuthi/Dyuthi-Regular.ttf"
        "https://gitlab.com/smc/dyuthi/raw/master/67-smc-dyuthi.conf")
md5sums=('3c8b344486817cdb6387536cd15ed065'
         'f4a275e1e8a1bd33c90ed44f1ee84017')
install=ttf-malayalam-fonts.install


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF" 
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
