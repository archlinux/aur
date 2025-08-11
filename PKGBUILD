# Maintainer: Kevin Jilissen <info@kevinjilissen.nl>

pkgname=mcrl2-bin
pkgver=202507.0
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
sha256sums=('29eba5b95aa11ce56ff3536a531d45626ab32ea0708005415987d2525cd4cb65')
install=mcrl2.install


build() {
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.gz" -C "${srcdir}/output"
}

package() {
  cp -r "${srcdir}/output/"* "${pkgdir}"
  install -d "${pkgdir}"/usr/bin
}
