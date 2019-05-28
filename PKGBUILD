# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-suruma
pkgver=3.2.1
pkgrel=1
pkgdesc="This is Suruma, a font belonging to a set of TrueType and OpenType fonts released under the GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
license=("GPL3")
depends=(fontconfig xorg-font-utils)
source=("http://smc.org.in/downloads/fonts/suruma/Suruma.ttf"
        "https://gitlab.com/smc/suruma/raw/master/67-smc-suruma.conf")
sha256sums=('b6519c9320c0ef1d628847ded10818b4d16ab98be5b634edafb5d900d4e44ff9'
            '46891cb4acb8579ae2576be8645a7909a4d464a70b4e7144d3bd6f95d2950b57')
install=ttf-malayalam-fonts.install


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
