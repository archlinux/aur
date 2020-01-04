# Maintainer: Jordan Day jordanday 4 4 4 at gmail.com
# Contributer: Josh VanderLinden <arch@cloudlery.com>
pkgname=adduser
pkgver=1.17
pkgrel=3
pkgdesc="Interactive front end to /usr/bin/useradd from Slackware Linux"
arch=('any')
url="http://www.slackware.com/"
license=('BSD')
provides=('adduser')
depends=('gawk' 'shadow>=4.1.5.1-3')
source=("http://mirrors.slackware.com/slackware/slackware64-current/source/a/shadow/adduser")
sha256sums=('48529666521de9e2ffb16640d60939c6bc1cedf3b633a0a62f1f511116850f45')

package() {
  install -D -m755 adduser "${pkgdir}/usr/bin/adduser"
  sed '/^###/q;1,2d;s/^# *//' adduser | head -n -2 > LICENSE
  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
