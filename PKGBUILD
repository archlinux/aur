# Maintainer: http://smc.org.in
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=otf-manjari
pkgver=1.810
pkgrel=1
pkgdesc="Malayalam unicode font with rounded terminals suitable for body text."
arch=(any)
url="http://smc.org.in/fonts/"
license=("OFL1.1")
depends=(fontconfig)
conflicts=(ttf-malayalam-font-manjari)
source=(
"https://smc.org.in/downloads/fonts/manjari/Manjari-Regular.otf"
"https://smc.org.in/downloads/fonts/manjari/Manjari-Thin.otf"
"https://smc.org.in/downloads/fonts/manjari/Manjari-Bold.otf"
"67-smc-manjari.conf"
)
sha256sums=('ddac452bfd3b54c0872b3715d63ac5f450432150e36e0f407521b84d1503a8ca'
            '3f2e8661bb161ab003b98c7b89b57d3935463c73bc8ace005228e22bed0ec011'
            '046d68563149702edc2f3a97d8dc927589c88a63e404b4836ac9ad208aea3f41'
            '9db802bf36c46debd96e9d63a152d8baf0a788e88e8675991ea2802706545780')
install=otf-malayalam-fonts.install


package() {
  # install otf
  mkdir -p "${pkgdir}/usr/share/fonts/OTF" || return 1
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF"
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
