# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=gdb-dashboard-git
_gitname=gdb-dashboard
pkgver=0.0.101.700c9b9
pkgrel=1
pkgdesc="Modular visual interface for GDB in Python"
url='https://github.com/cyrus-and/gdb-dashboard'
arch=('any')
license=('MIT')
depends=( 'gdb' 'binutils')
makedepends=('git')
provides=('gdb-dashboard')
conflicts=('gdb-dashboard')
install='gdb-dashboard.install'
source=(${pkgname}::git+https://github.com/cyrus-and/${_gitname})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "0.0" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname}
  install -Dm 644 .gdbinit -t "${pkgdir}/usr/share/${_gitname}"
  install -Dm 644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
