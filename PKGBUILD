# Maintainer: DJ Lucas <dj_AT_linuxfromscratch_DOT_org>

pkgname=samba-dhcpd-update
pkgver=20200420
pkgrel=1
arch=('any')
pkgdesc="Allow dhcpd to update Samba DNS"
url="n/a"
depends=('samba' 'dhcp')
license=('MPL')
source=('samba-dnsupdate.sh'
        'dhcpd-update-samba-dns.sh'
        'dhcpd-update-samba-dns.conf')
sha256sums=('574d91173235b242d682dc19b6e4e547242afb8ff6c9197b7d3fadbbfbe12ca4'
            '987b140911631809db70f9f7044700fec6c966e4da153da1c6d8a15d13632029'
            '90a500bc8680ae992e2b052b97d476e09b7a2fd55907870d6d385aa683fdc6d5')
backup=('etc/dhcpd/dhcpd-update-samba-dns.conf')

package() {
  install -vdm755 ${pkgdir}/usr/bin
  install -vdm755 ${pkgdir}/etc/dhcpd
  install -vm755 ${srcdir}/samba-dnsupdate.sh ${pkgdir}/usr/bin
  install -vm755 ${srcdir}/dhcpd-update-samba-dns.sh ${pkgdir}/usr/bin
  install -vm644 ${srcdir}/dhcpd-update-samba-dns.conf ${pkgdir}/etc/dhcpd
}
