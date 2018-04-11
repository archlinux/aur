# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-manjari
pkgver=1.5
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
sha256sums=('5140ab546b30d1917c6c714cc731ff77f9db8a2e04c164ad367f1429c2635e2d'
            '23d23afe7f5ad67aeca96d53329a29255e80ff4fbef22dcdb4e895fb4e1ec4f3'
            'c37488379f5cf9a69174471e70120bec1be1b687c0de18014d8098ddfa56b064'
            '518712f630448e9a7c35e11deccc6dcb7c11a08e96f523ce5bfe379b3a6e151b')
install=ttf-malayalam-fonts.install


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
