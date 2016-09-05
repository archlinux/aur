# Maintainer: Philip Goto
pkgname=mato-icons-git
pkgver=6e62401
pkgrel=1
pkgdesc="Mato is a Material Design inspired icon theme for Linux. It features simple and modern icons based on the official icons."
arch=('any')
url="https://github.com/flipflop97/Mato"
license=('Creative Commons Attribution-ShareAlike 4.0 International Public License')
makedepends=('git')
provides=('mato-icons-git')
options=(!strip !emptydirs)
install='mato-icons-git.install'
source=("${pkgname}::git+https://github.com/flipflop97/Mato.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git rev-parse --short HEAD
}

package() {
  install -dm 755 "${pkgdir}"/usr/share/icons

  mkdir "${pkgdir}"/usr/share/icons/Mato

  cp -dr --no-preserve='ownership' "${pkgname}"/* "${pkgdir}"/usr/share/icons/Mato
  rm "${pkgdir}"/usr/share/icons/Mato/install.sh

}
