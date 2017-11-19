# $Id$
# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=archlinux32-keyring
pkgver=20171113
pkgrel=1
pkgdesc='Arch Linux 32 PGP keyring'
arch=('any')
url='https://github.com/archlinux32/archlinux32-keyring.git/'
license=('GPL')
install="${pkgname}.install"
source=("git+https://github.com/archlinux32/archlinux32-keyring.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git show -s --format=%ci HEAD^{commit}|awk '{print$1}'|sed 's,-,,g'
}

package() {
  cd ${pkgname}
  make PREFIX=/usr DESTDIR=${pkgdir} install
}
