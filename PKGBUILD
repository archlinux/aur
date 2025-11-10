# Maintainer: Mark Hegreberg<mark@archlinux.org>
# Contributor: Patrick Wu <me@patrickwu.space>

pkgname=wslu
pkgver=4.1.10
pkgrel=1
pkgdesc="A collection of utilities for the Windows Subsystem for Linux"
arch=(any)
url='https://github.com/WhitewaterFoundry/wslu'
license=('GPL-3.0-or-later')
depends=('bc' 'psmisc')
optdepends=('imagemagick: custom icon support' 'bash-completion: for bash completion')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('efffbd93d08296e01bd1369a84e163d34820fccadf6d88e0feffae0cbf623a2d')

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
