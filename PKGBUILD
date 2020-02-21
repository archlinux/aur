# $Id$
# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=archlinux32-keyring
pkgver=20200219
pkgrel=1
pkgdesc='Arch Linux 32 PGP keyring'
arch=('any')
url='https://github.com/archlinux32/archlinux32-keyring.git/'
license=('GPL')
install="${pkgname}.install"
makedepends=('git')
source=("git+https://github.com/archlinux32/archlinux32-keyring.git")
source=("git+https://git2.archlinux32.org/archlinux32/$pkgname.git")
source=("git+https://git.archlinux32.org/archlinux32/$pkgname.git")
sha256sums=('SKIP')
sha256sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git show -s --format=%ci HEAD^{commit}|awk '{print$1}'|sed 's,-,,g'
}

package() {
  cd ${pkgname}
  make PREFIX=/usr DESTDIR=${pkgdir} install
}
