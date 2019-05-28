# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-keraleeyam
pkgver=3.0.0+20181007
pkgrel=1
pkgdesc="This is Keraleeyam, a font belonging to a set of TrueType and OpenType fonts released under the GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
license=("OFL1.1")
depends=(fontconfig xorg-font-utils)
source=("http://smc.org.in/downloads/fonts/keraleeyam/Keraleeyam-Regular.ttf"
        "https://gitlab.com/smc/keraleeyam/raw/master/67-smc-keraleeyam.conf")
sha256sums=('2160095e01a846972163244213e46c2c35156ca6bd25ce135e70b27685f1e538'
            'de32d00b046423dcb093e376025b22405b468b18280c3d885ef4aff0f4079adc')
install=ttf-malayalam-fonts.install


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
