# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-dyuthi
pkgver=3.0.0+20181007
pkgrel=1
pkgdesc="This is Dyuthi, a font belonging to a set of TrueType and OpenType fonts released under the GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
license=("OFL1.1")
depends=(fontconfig xorg-font-utils)
source=("http://smc.org.in/downloads/fonts/dyuthi/Dyuthi-Regular.ttf"
        "https://gitlab.com/smc/dyuthi/raw/master/67-smc-dyuthi.conf")
sha256sums=('f52b63e70e7114b3f4edcdcf16ff7341ca9376a5dd721360116dd507c60f440b'
            '3ca219d970748beaa7b64f3cacf398fff5f6164786f9db6a93292fa81c919652')
install=ttf-malayalam-fonts.install


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
