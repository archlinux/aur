# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

_pkgname=archiso
pkgname="${_pkgname}-git"
pkgver=21.3.gdc845b3
pkgrel=1
pkgdesc="Arch Linux livecd/liveusb generation scripts"
arch=('any')
url="http://archlinux.org"
license=('GPL')
depends=('libisoburn' 'squashfs-tools' 'dosfstools' 'lynx' 'arch-install-scripts')
optdepends=('qemu: quickly test isos')
makedepends=('git')
provides=('archiso')
conflicts=('archiso')
source=("git://projects.archlinux.org/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/-/./g;s/v//'
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
