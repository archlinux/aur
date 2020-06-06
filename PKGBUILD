# Maintainer: http://smc.org.in
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=otf-manjari
pkgver=1.800
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
sha256sums=('a554a2e183279960155c109aad8560a697a6690253dfdf5c416015c65a0164ea'
            '2873c84078687e7292fcccbc6e862cc38e332a8544035e4273e5af5bcb5cce5f'
            '1dc90b00e7350912178f0371e203fdf9b95eb64b14df718cd8401c6470672eed'
            '9db802bf36c46debd96e9d63a152d8baf0a788e88e8675991ea2802706545780')
install=otf-malayalam-fonts.install


package() {
  # install otf
  mkdir -p "${pkgdir}/usr/share/fonts/OTF" || return 1
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF"
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
