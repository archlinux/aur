# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-chilanka
pkgver=1.3+20181007
pkgrel=1
pkgdesc="This is Chilanka, a font belonging to a set of TrueType and OpenType fonts released under the GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
license=("OFL1.1")
depends=(fontconfig xorg-font-utils)
source=("http://smc.org.in/downloads/fonts/chilanka/Chilanka-Regular.ttf"
        "https://gitlab.com/smc/chilanka/raw/master/67-smc-chilanka.conf")
sha256sums=('09228f9ad03ac0544eca2cdcc99ebbd66dc2cf75df10958a070eaad047e834e0'
            'cf9d4c9e6efbd8bf676d9f1cabe86407ee570caa5f299bcbb8e4b5f46b59162a')
install=ttf-malayalam-fonts.install


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
