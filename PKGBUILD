# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-raghumalayalamsans
pkgver=2.2.0.0+20190606
pkgrel=1
pkgdesc="This is RaghuMalayalamSans, a font belonging to a set of TrueType and OpenType fonts released under the GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
license=("GPL2")
depends=(fontconfig xorg-font-utils)
source=("http://smc.org.in/downloads/fonts/raghumalayalamsans/RaghuMalayalamSans-Regular.ttf"
        "https://gitlab.com/smc/raghumalayalamsans/raw/master/67-smc-raghumalayalamsans.conf")
sha256sums=('433a09ea5f5f49ecd70f8ae20203e3a44c7956ab9d7d60450219b96fa097e1bd'
            'f10f226a68fb5226dcca8c03050071de35379afabbf8b9aba9624d9e5e0d53d9')
install=ttf-malayalam-fonts.install


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
