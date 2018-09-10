# Maintainer: Zhaofeng Li <hello@zhaofeng.li>

pkgname=dn42-peerfinder-client
pkgver=1.0.10
pkgrel=2
pkgdesc="A probe for the dn42 PeerFinder system"
arch=('any')
url="https://git.dn42.us/dn42/pingfinder"
license=('BSD')
depends=('iputils' 'curl')
backup=(
  'etc/dn42-peerfinder-client.conf'
)
source=(
  'client.sh::https://git.dn42.us/dn42/pingfinder/raw/master/clients/generic-linux-debian-redhat-busybox.sh'
  'LICENSE::https://git.dn42.us/dn42/pingfinder/raw/master/LICENSE.txt'
  'dn42-peerfinder-client.conf'
  'dn42-peerfinder-client.service'
  'dn42-peerfinder-client.timer'
)
md5sums=('3a736fd810f67468434fdcdaf10d2815'
         'bb9f80fd1814f45ecce2616098653c50'
         '9ace51cd9696f22f925860525aac3261'
         '6e582d4de4073d5f7b94a56fb639fcf1'
         '94048a42d72fe761cf3475feb06fbb31')

package() {
  install -Dm755 "${srcdir}/client.sh" "${pkgdir}/usr/lib/dn42-peerfinder-client/client.sh"
  install -Dm644 "${srcdir}/dn42-peerfinder-client.conf" "${pkgdir}/etc/dn42-peerfinder-client.conf"
  install -Dm644 "${srcdir}/dn42-peerfinder-client.service" "${pkgdir}/usr/lib/systemd/system/dn42-peerfinder-client.service"
  install -Dm644 "${srcdir}/dn42-peerfinder-client.timer" "${pkgdir}/usr/lib/systemd/system/dn42-peerfinder-client.timer"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
