# Maintainer: http://smc.org.in
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=otf-manjari
pkgver=1.910
pkgrel=1
pkgdesc="Malayalam unicode font with rounded terminals suitable for body text."
arch=(any)
url="http://smc.org.in/fonts/"
license=("OFL1.1")
depends=(fontconfig)
source=(
"https://smc.org.in/downloads/fonts/manjari/Manjari-Regular.otf"
"https://smc.org.in/downloads/fonts/manjari/Manjari-Thin.otf"
"https://smc.org.in/downloads/fonts/manjari/Manjari-Bold.otf"
"67-smc-manjari.conf"
)
sha256sums=('c5610c144bbfc5ddfb514b8428596d0432a34da6c646fdd02e2e0967ab31d8dd'
            '02c21415dff7f3cb81b67d7ba42cd2ba0317e3c3f905dcb97f732cb323ec2180'
            '01932f12af88f7726604d185ddba3320f31d8f1f4ebcf10b5f6127f51cdf3116'
            '9db802bf36c46debd96e9d63a152d8baf0a788e88e8675991ea2802706545780')
install=otf-malayalam-fonts.install


package() {
  # install otf
  mkdir -p "${pkgdir}/usr/share/fonts/OTF" || return 1
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF"
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
