# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-manjari
pkgver=1.6
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
sha256sums=('ea56661ba76c36885886f2924254a753a41dc62f20ad47e4bbf266cc7d17a94c'
            'bddc73f94956e50304e1e1c6daa87ffb0b3f727d14c951aec0e7d4874c483fd4'
            'aabc0a0322e746ab8d01fa22c1d30d382dfb64f9f172bb8f4168a3f995f64a2c'
            '518712f630448e9a7c35e11deccc6dcb7c11a08e96f523ce5bfe379b3a6e151b')
install=ttf-malayalam-fonts.install


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
