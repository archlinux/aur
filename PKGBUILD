# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=bdisk-git
pkgver=0.0001
pkgrel=2
pkgdesc="An easy liveCD creator built in python. Supports hybrid ISOs/USB, iPXE, and UEFI (undergoing rewrite)"
arch=( 'i686' 'x86_64' )
url="https://bdisk.square-r00t.net"
license=( 'GPL3' )
depends=( 'python' 'dosfstools' 'gcc-multilib' 'gcc-libs-multilib' 'git' 'libisoburn' 'mtools' 'rsync' 'squashfs-tools' 'syslinux' )
makedepends=( 'python' )
_pkgname=bdisk
install=
changelog=
noextract=()
source=("bdisk::git+git://git.square-r00t.net/bdisk.git")
# see https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git_Submodules if you require git submodules
sha512sums=('SKIP')
pkgver() {
  cd "${srcdir}/${_pkgname}"
  # no tags, so number of revisions e.g. r1142.a17a017
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ## most recent annotated tag e.g. 2.0.r6.ga17a017
  #git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  ## most recent un-annotated tag e.g. 0.71.r115.gd95ee07
  #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  ## or:
  ##git describe --long --tags | sed 's/-/.r/;s/-/./'
  ## project uses tags with prefix. e.g. v...
  #git describe --long | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
  ## both with fallback, e.g. 0.9.9.r27.g2b039da with tags, else r1581.2b039da
  #( set -o pipefail
  #  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  #  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #)
}
build() {
	echo "TODO: This package doesn't install in a meaningful way. However, it will soon be a python package and CLI utility."
}
package() {
	echo "TODO: This package doesn't install in a meaningful way. However, it will soon be a python package and CLI utility."
}
