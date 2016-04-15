pkgname=openvpn-update-resolv-conf-git
pkgver=r24.994574f
pkgrel=1
pkgdesc="OpenVPN Update resolvconf"
arch=('any')
url="https://github.com/masterkorp/openvpn-update-resolv-conf"
license=('GPL')
makedepends=('git')
depends=('openvpn' 'openresolv' 'bash')
source=('git://github.com/masterkorp/openvpn-update-resolv-conf')
sha256sums=('SKIP')
pkgver() {
  cd $srcdir/openvpn-update-resolv-conf
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Install vim files.
  cd $srcdir/openvpn-update-resolv-conf
  install -D -m655 update-resolv-conf.sh "${pkgdir}/etc/openvpn/update-resolv-conf"
}

# vim:set ts=2 sw=2 et:
