# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=sbupdate-git
pkgver=0.r98.be9c5ea
pkgrel=1
pkgdesc="Generate and sign kernel images for UEFI Secure Boot"
arch=('any')
url="https://github.com/andreyv/sbupdate"
license=('GPL3')
install=sbupdate.install
depends=('bash>=4.4' 'systemd' 'binutils' 'sbsigntools')
makedepends=('git')
backup=('etc/sbupdate.conf')
source=("git+https://github.com/andreyv/sbupdate.git")
sha256sums=('SKIP')

pkgver() {
  cd sbupdate
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd sbupdate
  make DESTDIR="${pkgdir}" DOCDIR="/usr/share/doc/${pkgname}" install
}

# vim:set ts=2 sw=2 et:
