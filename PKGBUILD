# Maintainer: Jordan Day jordanday 4 4 4 at gmail.com
# Contributer: Josh VanderLinden <arch@cloudlery.com>
pkgname=adduser
pkgver=1.17
pkgrel=1
pkgdesc="Interactive front end to /usr/bin/useradd from Slackware Linux"
arch=('any')
url="http://www.slackware.com/"
license=('BSD')
provides=('adduser')
depends=('gawk' 'shadow>=4.1.5.1-3')
source=("http://mirrors.slackware.com/slackware/slackware64-current/source/a/shadow/adduser")
md5sums=('285f4e8d9f24c690a44af7cd17ffb9a2')

package() {
  install -D -m755 adduser "${pkgdir}/usr/bin/adduser"
  sed '/^###/q;1,2d;s/^# *//' adduser | head -n -2 > LICENSE
  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
