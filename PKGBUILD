# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=ec_access
pkgname="${_pkgname}"
pkgver='2010.01'
pkgrel=1
arch=(
  'x86_64'
  'i686'
  'i386'
  'armv7h'
  'armv6h'
  'aarch64'
  'pentium4'
  'riscv64'
)
license=(
  'GPL-2.0-only'
)
pkgdesc="Small utility to read and write embedded controllder data at '/sys/kernel/debug/ec/ec0/io' (needs 'ec_sys' kernel module to be loaded)."
groups=()
url='https://apps.kde.org/kate/'
depends=(
  'glibc'
)
optdepends=()
makedepends=(
  'gcc'
)
checkdepends=()
conflicts=()
provides=()
replaces=()
source=(
  "https://ftp.suse.com/pub/people/trenn/sources/ec/ec_access.c"
  # "https://raw.githubusercontent.com/torvalds/linux/refs/heads/master/tools/power/acpi/tools/ec/ec_access.c"
)
sha256sums=(
  'a173f25bc4b9d5b33920924f02aa20ae0cd39596166c621f130c07fe675313eb'  # ec_access.c
)

build() {
  cd "${srcdir}"

  gcc -o ec_access ec_access.c
}

package() {
  cd "${srcdir}"

  install -Dvm755 -t "${pkgdir}/usr/bin"  ec_access
}
