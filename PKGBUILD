# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com

pkgname=ttf-malayalam-font-keraleeyam
pkgver=1.0_beta
pkgrel=1
pkgdesc="This is Keraleeyam, a font belonging to a set of TrueType and OpenType fonts released under 
the 
GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
depends=(fontconfig xorg-font-utils)
source=("http://smc.org.in/downloads/fonts/keraleeyam/Keraleeyam.ttf"
        "https://gitlab.com/smc/keraleeyam/raw/master/67-smc-keraleeyam.conf")
md5sums=('0c3651bb646b4af3c2ff1b30e2e5f809'
         '37d7da81268fa7cf4a9702d241c7ea1c')
install=ttf-malayalam-fonts.install


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF" 
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
