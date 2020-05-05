# Maintainer: Alec Mev <alec@mev.earth>

_name=minimal
pkgname="zsh-theme-${_name}-git"
pkgver=r64.2c89c47
pkgrel=1
pkgdesc='A minimal and extensible Zsh theme'
arch=('any')
url=https://github.com/subnixr/minimal
license=('GPL3')
depends=('zsh')
optdepends=(
  'git: Git branch status support'
  'mercurial: Mercurial branch status support'
)
source=("${pkgname}::git+https://github.com/subnixr/minimal.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "`git rev-list --count HEAD`" "`git rev-parse --short HEAD`"
}

package() {
  cd "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
  install -Dm644 -t "${pkgdir}/usr/share/zsh/plugins/theme-${_name}" minimal.zsh
}
