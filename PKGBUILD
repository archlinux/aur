# Maintainer: Patrick Wu <me@patrickwu.space>

pkgname=wslu
pkgver=3.0.0
pkgrel=0
pkgdesc="A collection of utilities for Windows 10 Linux Subsystems"
arch=('any')
url='https://github.com/wslutilities/wslu'
license=('GPL-3.0-or-later')
depends=('bc' 'imagemagick' 'bash-completion')
makedepends=("make" "git" "gzip")
source=("git+https://github.com/wslutilities/wslu.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd wslu
  make
}

package() {
  cd wslu

  make DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/wslu/
}

# vim: ts=2 sw=2 et:
