# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-rachana
pkgver=7.0.0+20200101
pkgrel=1
pkgdesc="This is Rachana, a font belonging to a set of TrueType and OpenType fonts released under the GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
license=("OFL1.1")
depends=(fontconfig xorg-font-utils)
source=("http://smc.org.in/downloads/fonts/rachana/Rachana-Regular.ttf"
        "https://gitlab.com/smc/rachana/raw/master/65-0-smc-rachana.conf")
sha256sums=('50688439e1a63894d875650be2e1c0356c73487d978657ea4776e0678762815c'
            'fa5f4fc01ed63ae0d50e12083657b218134196346102af92bf3513642f47078c')
install=ttf-malayalam-fonts.install


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
