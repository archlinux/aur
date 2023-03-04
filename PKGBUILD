# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

pkgname=phc-intel
groups=(
  'linux-phc'
  'phc-intel'
)
epoch=1
pkgver=0.3.2.rev44.r52.20230220.f0f42bd
pkgrel=1
pkgdesc="Meta package that depends on phc intel kernel driver, helper script and initscript."
url="https://gitlab.com/linux-phc/phc-intel"
arch=('any')
license=('custom: public domain')
depends=(
  'PHC-INTEL-MODULE'
  'phc-intel-scripts'
  'PHC-INTEL-INITSCRIPT'
)
makedepends=()
optdepends=()
provides=(
  'linux-phc'
)
conflicts=()
source=(
  'license.dummypackage.txt'
)
sha256sums=(
  '0e0aeb02347977abaa12efcbd9ccfe4d69b9cdf60868c60eb3dda4f1c38b93cd' # license.dummypackage.txt
)

pkgver() {
  # Set version to be the same as the installed package `PHC-INTEL-MODULE`:
  pacman -Q PHC-INTEL-MODULE | awk '{print $2}' | awk -F- '{print $1}'
}

package() {
  install -Dvm644 "${srcdir}/license.dummypackage.txt"  "${pkgdir}/usr/share/licenses/${pkgname}/license.dummypackage.txt"
}
