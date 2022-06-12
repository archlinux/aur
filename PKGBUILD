# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Erich Eckner <deep42thought@archlinux32.org>pkgname=archlinux32-keyring-git
_pkgname="archlinux32-keyring"
pkgname=$_pkgname-git
pkgver=v20220131+2+gdeb5ba6
pkgrel=1
pkgdesc='Arch Linux 32 PGP keyring (git package)'
arch=('any')
url='https://archlinux32.org'
license=('GPL')
install=$_pkgname.install
makedepends=("git")
provides=($_pkgname)
replaces=($_pkgname)
source=('git+https://git.archlinux32.org/archlinux32-keyring'
	$_pkgname.install)
sha512sums=('SKIP'
            'SKIP')
validpgpkeys=('DE9F7688CACF04FEB81A6C590AEEC90755DA7B5A')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

package() {
    cd ${_pkgname}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}
