# Maintainer: Janne Aho <aur@aho.hk>
pkgname="open-iscsi-openrc"
pkgver="1.0.0"
pkgrel="0"
pkgdesc="The OpenRC init script and config file for open-iscsi"
url="https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-block/open-iscsi/files"
license=('GPL')
arch=('any')
depends=('openrc' 'open-iscsi')
gentoo_commit="94ae36b9c42cc64f73ee27d9955569b8cefeab73"
source=(
  "https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-block/open-iscsi/files/iscsid-conf.d?id=${gentoo_commit}"
  "https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-block/open-iscsi/files/iscsid-init.d?id=${gentoo_commit}"
)
md5sums=(
'4860cc9a2a8396bb965545da7e253417'
'6bb28543ea795b549e7b5ce7548deaab'
)

package() {
  install -Dm640 "${srcdir}/iscsid-conf.d?id=${gentoo_commit}" "${pkgdir}/etc/conf.d/iscsid"
  install -Dm755 "${srcdir}/iscsid-init.d?id=${gentoo_commit}" "${pkgdir}/etc/init.d/iscsid"
}
