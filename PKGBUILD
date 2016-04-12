# Contributor: Aashik S  aashiks at inflo dot ws
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com

pkgname=ttf-malayalam-font-anjalioldlipi
pkgver=6.1.1
pkgrel=1
pkgdesc="This is Anjali Old Lipi, a font belonging to a set of TrueType and OpenType fonts released 
under the 
GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
depends=(fontconfig xorg-font-utils)
source=("http://smc.org.in/downloads/fonts/anjalioldlipi/AnjaliOldLipi.ttf"
        "https://gitlab.com/smc/anjalioldlipi/raw/master/67-smc-anjalioldlipi.conf")
md5sums=('9eedaf7396ba99a6086af5f2c154bd7c'
         '9b343beb71398383af33988a9829bc05')
install=ttf-malayalam-fonts.install


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF" 
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
