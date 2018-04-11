# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-manjari
pkgver=1.4
pkgrel=1
pkgdesc="Malayalam unicode font with rounded terminals suitable for body text."
arch=(any)
url="http://smc.org.in/fonts/"
license=("OFL1.1")
depends=(fontconfig xorg-font-utils)
source=(
"https://smc.org.in/downloads/fonts/manjari/Manjari-Regular.ttf"
"https://smc.org.in/downloads/fonts/manjari/Manjari-Thin.ttf"
"https://smc.org.in/downloads/fonts/manjari/Manjari-Bold.ttf"
"67-smc-manjari.conf"
)
sha256sums=('7be64c927fd7b3dc9517c67513617bd450641d0785cdc5d3aade9a21f9c419a1'
            '9b60df692d9c0f56fb18e35dae8676c5389683d7116cf3986cc469ff76459805'
            'b3293a036002ff7781b3a7fedd620aa7bb7fdf39ef326b37a7db3e90ae38e6f4'
            '518712f630448e9a7c35e11deccc6dcb7c11a08e96f523ce5bfe379b3a6e151b')
install=ttf-malayalam-fonts.install


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
