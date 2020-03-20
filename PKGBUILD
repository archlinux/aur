# Maintainer: Derek Taylor (DistroTube) <derek@distrotube.com>
pkgname=shell-color-scripts
pkgver=0.1
pkgrel=1
pkgdesc="A collection of terminal color scripts.  A random color script is selected when you open bash or zsh."
arch=(x86_64 i686)
url="https://gitlab.com/dwt1/shell-color-scripts.git"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=(bash zsh)
provides=(shell-color-scripts)
conflicts=()
replaces=()
backup=()
options=()
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
  cd "${pkgname}"  
  rm -rf "${pkgdir}/opt/shell-color-scripts" || return 1
  mkdir -p $pkgdir/opt/shell-color-scripts || return 1
  cp -rf * $pkgdir/opt/shell-color-scripts || return 1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

