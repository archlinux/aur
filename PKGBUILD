# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com

pkgname=ttf-malayalam-font-raghumalayalamsans
pkgver=2.0.1
pkgrel=1
pkgdesc="This is Raghu Malayalam Sans, a font belonging to a set of TrueType and OpenType fonts 
released 
under the 
GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
depends=(fontconfig xorg-font-utils)
source=("http://smc.org.in/downloads/fonts/raghumalayalamsans/RaghuMalayalamSans.ttf"
        "https://gitlab.com/smc/raghumalayalamsans/raw/master/67-smc-raghumalayalamsans.conf")
md5sums=('9417236366dbe7514d70ec681911874d'
         '3ea0148691b9cbfe12bf17a1f0456bad')
install=ttf-malayalam-fonts.install


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF" 
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
