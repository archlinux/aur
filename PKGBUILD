# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

_pkgname=archiso32
pkgname="${_pkgname}-git"
pkgver=i686.33.2.g1e308c7
pkgrel=1
pkgdesc="Arch Linux 32 livecd/liveusb generation scripts"
arch=('any')
url="http://archlinux32.org"
license=('GPL')
depends=('libisoburn' 'squashfs-tools' 'btrfs-progs' 'dosfstools' 'lynx' 'arch-install-scripts')
optdepends=('qemu: quickly test isos')
makedepends=('git')
provides=('archiso')
conflicts=('archiso')
source=("git://github.com/archlinux32/${_pkgname}.git")
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
