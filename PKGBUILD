# Maintianer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Adrian C. <anrxc..sysphere.org>

pkgname=vicious-git
_pkgname=vicious
pkgver=2.1.1.207.g4c082ac
pkgrel=1
pkgdesc='Widgets for the Awesome window manager'
arch=('any')
url='http://git.sysphere.org/vicious/about/'
license=('GPL2')
depends=('lua')
makedepends=('git')
optdepends=(
  'hddtemp: for the HDD Temp widget type'
  'alsa-utils: for the Volume widget type'
  'wireless_tools: for the Wireless widget type'
  'curl: for widget types accessing network resources'
)
provides=($_pkgname)
conflicts=($_pkgname)
source=(${pkgname}::git+http://git.sysphere.org/${_pkgname})
md5sums=('SKIP')


pkgver() {
  cd $pkgname
  git describe --always | sed 's|^[^0-9]*||;s|\.g[a-f0-9]*$||;s|-|.|g'
}

package () {
  cd $pkgname
  # Install the vicious library
  install -dm755 "$pkgdir"/usr/share/lua/5.3/$pkgname/{widgets,contrib}
  install -m644 *.lua "$pkgdir/usr/share/lua/5.3/$pkgname"
  install -m644 widgets/*.lua "$pkgdir/usr/share/lua/5.3/$pkgname/widgets"
  install -m644 contrib/*.lua "$pkgdir/usr/share/lua/5.3/$pkgname/contrib"
}

# vim:set ts=2 sw=2 et:
