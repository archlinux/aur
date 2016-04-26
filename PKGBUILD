# Maintainer: DJ Lucas <dj_AT_linuxfromscratch_DOT_org>

pkgname=samba-dhcpd-update
pkgver=20160426
pkgrel=1
arch=('any')
pkgdesc="Allow dhcpd to update Samba DNS"
url="n/a"
depends=('samba>=4.0' 'dhcp')
license=('MPL')
source=('samba-dnsupdate.sh'
        'dhcpd-update-samba-dns.sh'
        'dhcpd-update-samba-dns.conf')
sha256sums=('f08a0afe7440d317b722afe556098407482bd6c6dc81eca005d5b036187880e7'
            '987b140911631809db70f9f7044700fec6c966e4da153da1c6d8a15d13632029'
            'c71d4c58ca59436fba35cb64d861e6cfc9c9ae7218f0e5387f1f68bd38260bbc')
backup=('etc/dhcpd/dhcpd-update-samba-dns.conf')

package() {
  install -vdm755 ${pkgdir}/usr/bin
  install -vdm755 ${pkgdir}/etc/dhcpd
  install -vm755 ${srcdir}/samba-dnsupdate.sh ${pkgdir}/usr/bin
  install -vm755 ${srcdir}/dhcpd-update-samba-dns.sh ${pkgdir}/usr/bin
  install -vm644 ${srcdir}/dhcpd-update-samba-dns.conf ${pkgdir}/etc/dhcpd
}
