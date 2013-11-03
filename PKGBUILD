# $Id$
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# SELinux Maintainer: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)

pkgname=pambase-selinux
pkgver=20130928
pkgrel=1
pkgdesc="SELinux aware base PAM configuration for services"
arch=('any')
url="http://www.archlinux.org"
license=('GPL')
groups=('selinux')
conflicts=("${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}")
source=('system-auth'
        'system-local-login'
        'system-login'
        'system-remote-login'
        'system-services'
        'other')
backup=('etc/pam.d/system-auth'
        'etc/pam.d/system-local-login'
        'etc/pam.d/system-login'
        'etc/pam.d/system-remote-login'
        'etc/pam.d/system-services'
        'etc/pam.d/other')
md5sums=('6116b8e199a3dfd26a085a67a718435d'
         '477237985820117a0e6e1b13a86eb599'
         'df1a7a80ad7084404286335a44e4b754'
         '477237985820117a0e6e1b13a86eb599'
         '6969307eef026979703a6eba33c2e3eb'
         '6e6c8719e5989d976a14610f340bd33a')

package() {
  install -dm755 "$pkgdir/etc/pam.d"
  install -m644 -t "$pkgdir/etc/pam.d" "${source[@]}"
}

# vim:set ts=2 sw=2 et:
