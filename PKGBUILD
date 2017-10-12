# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-meera
pkgver=7.0.0+20171009
pkgrel=1
pkgdesc="This is Meera, a font belonging to a set of TrueType and OpenType fonts released under the GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
depends=(fontconfig xorg-font-utils)
source=("http://smc.org.in/downloads/fonts/meera/Meera.ttf"
        "https://gitlab.com/smc/meera/raw/master/65-0-smc-meera.conf")
md5sums=('cbb502b60c4b6d9a3b78f186f3beefe8'
         '4c02bd80a4d2b9fcfd47ef7685357359')
install=ttf-malayalam-fonts.install


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF" 
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
