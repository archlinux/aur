# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com

pkgname=ttf-malayalam-font-rachana
pkgver=6.1.1
pkgrel=1
pkgdesc="This is Rachana, a font belonging to a set of TrueType and OpenType fonts released under the 
GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
depends=(fontconfig xorg-font-utils)
source=("http://smc.org.in/downloads/fonts/rachana/Rachana.ttf"
        "https://gitlab.com/smc/rachana/raw/master/65-0-smc-rachana.conf")
md5sums=('a748e218606bf19eb281fe13b4ecbeac'
         '92733c3f554307060ad17a1f7a4e6ba8')
install=ttf-malayalam-fonts.install


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF" 
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
