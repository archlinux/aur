# Maintainer: Kyle <kyle@free2.ml>
# Contributer: Storm Dragon <storm_dragon@linux-a11y.org>
pkgname=configure-wifi-git
_gitname=configure-wifi
pkgver=2019.06.11 # automatically determined from pkgver function
pkgrel=1
pkgdesc="A user friendly wireless network selection menu that configures wpa_supplicant and systemd-networkd"
arch=(any)
url="https://gitlab.com/ky1e/configure-wifi"
license=('GPL3')
depends=('crda' 'dialog' 'iw' 'wpa_supplicant')
makedepends=('git')
provides=('')
conflicts=('')
source=('git+https://gitlab.com/ky1e/configure-wifi.git')
md5sums=('SKIP')

pkgver() {
  date +%Y.%m.%d
}

package() {
  cd $_gitname
  install -D -m 755 configure-wifi $pkgdir/usr/bin/configure-wifi
  for l in po/*mo; do
    install -D -m 755 $l $pkgdir/usr/share/locale/$(basename ${l%%.mo})/LC_MESSAGES/configure-wifi.mo
  done
}

# vim:set ts=2 sw=2 et:
