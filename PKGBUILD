# Maintainer: Derek Taylor (DistroTube) <derek@distrotube.com>
# Contributor: Kunkgg <goukun07@gmail.com>
pkgname=shell-color-scripts
_pkgname=shell-color-scripts
pkgver=1.1.r112.2607a72
pkgrel=1
pkgdesc="A CLI for the collection of terminal color scripts. Included 52 beautiful terminal color scripts."
arch=('i686' 'x86_64')
url="https://gitlab.com/dwt1/shell-color-scripts.git"
license=('MIT')
groups=()
depends=(binutils)
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

pkgver() {
  cd "${_pkgname}"
  printf "1.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_pkgname}
  rm -rf "${pkgdir}/opt/${pkgname}/colorscripts"
  mkdir -p "${pkgdir}/opt/${pkgname}/colorscripts"
  install -Dm644 colorscript.1 "${pkgdir}/usr/local/man/man1/colorscript.1"
  install -Dm755 colorscripts/* -t "${pkgdir}/opt/${pkgname}/colorscripts"
  install -Dm755 completions/* -t "${pkgdir}/opt/${pkgname}/completions"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm755 colorscript.sh "${pkgdir}"/usr/bin/colorscript
}
