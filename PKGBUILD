# Maintainer: Mark Hegreberg<mark@archlinux.org>
# Contributor: Patrick Wu <me@patrickwu.space>

pkgname=wslu
pkgver=4.1.0
pkgrel=1
pkgdesc="A collection of utilities for the Windows Subsystem for Linux"
arch=(any)
url='https://github.com/wslutilities/wslu'
license=('GPL-3.0-or-later')
depends=('bc' 'psmisc')
optdepends=('imagemagick: custom icon support' 'bash-completion: for bash completion')
source=("git+https://github.com/wslutilities/wslu.git#tag=v${pkgver}")
sha256sums=('12943003d4936b1dc8b9449fd1864960e8a05fa6d7cad89de47269572ff713ff')

build() {
  cd wslu
  bash ./configure.sh --build
  make
}

package() {
  cd wslu
  make DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/wslu/
}
