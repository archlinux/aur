# Maintainer: Jordan Day jordanday 4 4 4 at gmail.com
# Contributer: Josh VanderLinden <arch@cloudlery.com>
pkgname=adduser
pkgver=1.17
pkgrel=2
pkgdesc="Interactive front end to /usr/bin/useradd from Slackware Linux"
arch=('any')
url="http://www.slackware.com/"
license=('BSD')
provides=('adduser')
depends=('gawk' 'shadow>=4.1.5.1-3')
source=("http://mirrors.slackware.com/slackware/slackware64-current/source/a/shadow/adduser")
sha512sums=('32d38c271830b2f65b1a00354db4ea3075362c0cfe9110ccb2f07c1a552d6c6cc04c5db451e005fdda93fa3107feca9ddc1124db8398e5b4a818241d234c7d37')

package() {
  install -D -m755 adduser "${pkgdir}/usr/bin/adduser"
  sed '/^###/q;1,2d;s/^# *//' adduser | head -n -2 > LICENSE
  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
