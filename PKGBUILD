# Contributor: Aashik S  ashik at inflo dot ws
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com

pkgname=ttf-malayalam-font-dyuthi
pkgver=1.0
pkgrel=1
pkgdesc="This is Dyuthi, a font belonging to a set of TrueType and OpenType fonts released under the 
GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
depends=(fontconfig xorg-font-utils)
source=("http://smc.org.in/downloads/fonts/dyuthi/Dyuthi.ttf"
        "https://gitlab.com/smc/dyuthi/raw/master/67-smc-dyuthi.conf")
md5sums=('c1e43e83fee45ef05fc1f14f832f7d11'
         'f4a275e1e8a1bd33c90ed44f1ee84017')
install=ttf-malayalam-fonts.install


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF" 
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
