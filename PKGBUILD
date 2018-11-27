# Maintainer: http://smc.org.in
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=otf-manjari
pkgver=1.710
pkgrel=1
pkgdesc="Malayalam unicode font with rounded terminals suitable for body text."
arch=(any)
url="http://smc.org.in/fonts/"
license=("OFL1.1")
depends=(fontconfig xorg-font-utils)
conflicts=(ttf-malayalam-font-manjari)
source=(
"https://smc.org.in/downloads/fonts/manjari/Manjari-Regular.otf"
"https://smc.org.in/downloads/fonts/manjari/Manjari-Thin.otf"
"https://smc.org.in/downloads/fonts/manjari/Manjari-Bold.otf"
"67-smc-manjari.conf"
)
sha256sums=('56b340420124a0049c122b63f21fbc3c8502967c5dc5228f6bdb0bf6a500d9db'
            '19be26fd2fd7b3c973239988932d494ca2f1d0df1d1044eacde871a9f951bbc5'
            '53e1465b48bbf7d3f8cb50906bf2c7fa18453416eb4727a3f22a2d0898cac446'
            '9db802bf36c46debd96e9d63a152d8baf0a788e88e8675991ea2802706545780')
install=otf-malayalam-fonts.install


package() {
  # install otf
  mkdir -p "${pkgdir}/usr/share/fonts/OTF" || return 1
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF"
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
