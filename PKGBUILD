# Maintainer: Jordan Day jordanday 4 4 4 at gmail.com
# Contributer: Josh VanderLinden <arch@cloudlery.com>
pkgname=adduser
pkgver=1.18
pkgrel=1
pkgdesc="Interactive front end to /usr/bin/useradd from Slackware Linux"
arch=('any')
url="http://www.slackware.com/"
license=('BSD')
provides=('adduser')
depends=('gawk' 'shadow>=4.1.5.1-3')
source=("http://mirrors.slackware.com/slackware/slackware64-current/source/a/shadow/adduser")
sha256sums=('3fcf999e048a93aa5e4c7fdbb11a53da0ce0b3b1cf9793ebcbe4dcfbc2f1508e')

package() {
  install -D -m755 adduser "${pkgdir}/usr/bin/adduser"
  sed '/^###/q;1,2d;s/^# *//' adduser | head -n -2 > LICENSE
  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
