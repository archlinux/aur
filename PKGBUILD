# Maintainer: Kevin Jilissen <info@kevinjilissen.nl>

pkgname=mcrl2-bin
pkgver=202607.0
pkgrel=1
pkgdesc="A formal specification language with an associated toolset installed from the 'deb' GitHub release package."
arch=('x86_64')
provides=('mcrl2')
conflicts=('mcrl2')
depends=('qt6-base' 'glu' 'hicolor-icon-theme')
optdepends=('python: for easily running the included examples')
url=https://www.mcrl2.org
license=('Boost')
source=("https://github.com/mCRL2org/mCRL2/releases/download/mcrl2-${pkgver}/mcrl2-${pkgver}_${arch}.deb")
sha256sums=('00cb4c347638b3a418fb67c9d67b8d2bf2245e10d4affa4cd993b1c357bde969')
install=mcrl2.install


build() {
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.gz" -C "${srcdir}/output"
}

package() {
  cp -r "${srcdir}/output/"* "${pkgdir}"
  install -d "${pkgdir}"/usr/bin
}
