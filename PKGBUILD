# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-anjalioldlipi
pkgver=7.0.0+20181007
pkgrel=1
pkgdesc="This is Anjali Old Lipi, a font belonging to a set of TrueType and OpenType fonts released under the GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
license=("OFL1.1")
depends=(fontconfig xorg-font-utils)
source=("http://smc.org.in/downloads/fonts/anjalioldlipi/AnjaliOldLipi-Regular.ttf"
        "https://gitlab.com/smc/anjalioldlipi/raw/master/67-smc-anjalioldlipi.conf")
sha256sums=('db5f5535876e5d9b82f3459c0b67399ef794a98c251b2e4e67bffe382b7e7269'
            '8f43ab55f2223ebf73f24355c17e163ec5664bc6bd5f03d9fe82381c66ca35ea')
install=ttf-malayalam-fonts.install


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
