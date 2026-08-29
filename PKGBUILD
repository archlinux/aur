# Maintainer: xifan <xifan2333@gmail.com>
pkgname=herdr-corral-bin
_pkgname=herdr-corral
pkgver=0.1.9
pkgrel=1
pkgdesc="VS Code-style terminal workbench plugin for Herdr (Explorer / SCM / GitHub)"
arch=('x86_64' 'aarch64')
url="https://github.com/xifan2333/herdr-corral"
license=('MIT')
depends=('glib2')
optdepends=(
  'herdr: launch as a left-docked sidebar plugin'
  'git-delta: syntax-highlighted diff viewer'
  'github-cli: GitHub sidebar and detail client'
  'nvim: owner-scoped editor / preview pane'
  'imv: open GitHub attachment images from the detail client'
)
provides=('corral' 'herdr-corral')
conflicts=('corral' 'herdr-corral' 'herdr-corral-git')
options=(!strip)
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.xz::https://github.com/xifan2333/herdr-corral/releases/download/v0.1.9/herdr-corral-0.1.9-x86_64.tar.xz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.xz::https://github.com/xifan2333/herdr-corral/releases/download/v0.1.9/herdr-corral-0.1.9-aarch64.tar.xz")
sha256sums_x86_64=('b14762a67246863e3dbef7d1ee4f07a927b28fd78724831660eade8578a69073')
sha256sums_aarch64=('SKIP')

package() {
  local tree="${srcdir}/${_pkgname}-${pkgver}-${CARCH}"
  cd "${tree}"

  install -Dm755 bin/corral        "${pkgdir}/usr/bin/corral"
  install -Dm755 bin/corral-github "${pkgdir}/usr/bin/corral-github"
}
