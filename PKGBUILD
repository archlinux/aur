# Maintainer: Kevin Jilissen <info@kevinjilissen.nl>

pkgname=mcrl2-bin
pkgver=202407.0
pkgrel=1
pkgdesc="A formal specification language with an associated toolset installed from the 'deb' GitHub release package."
arch=('x86_64')
provides=('mcrl2')
conflicts=('mcrl2')
depends=('qt5-base' 'glu' 'hicolor-icon-theme')
optdepends=('python: for easily running the included examples')
url=https://www.mcrl2.org
license=('Boost')
source=("https://github.com/mCRL2org/mCRL2/releases/download/mcrl2-${pkgver}/mcrl2-${pkgver}_${arch}.deb")
sha256sums=('959cb43a603cb6adf7acf84c21c55a0c1016cb14aaeb065a22c2ae6125515a71')
install=mcrl2.install


build() {
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.gz" -C "${srcdir}/output"
}

package() {
  cp -r "${srcdir}/output/"* "${pkgdir}"
  install -d "${pkgdir}"/usr/bin
}
