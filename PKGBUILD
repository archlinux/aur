# Maintainer: xifan <xifan2333@gmail.com>
pkgname=herdr-corral-bin
_pkgname=herdr-corral
pkgver=0.1.10
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
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.xz::https://github.com/xifan2333/herdr-corral/releases/download/v0.1.10/herdr-corral-0.1.10-x86_64.tar.xz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.xz::https://github.com/xifan2333/herdr-corral/releases/download/v0.1.10/herdr-corral-0.1.10-aarch64.tar.xz")
sha256sums_x86_64=('206284049c8bd65a451019dfe977261be36eb63192906b9e7f1a9a2497fc88fa')
sha256sums_aarch64=('SKIP')

package() {
  local tree="${srcdir}/${_pkgname}-${pkgver}-${CARCH}"
  cd "${tree}"

  install -Dm755 bin/corral        "${pkgdir}/usr/bin/corral"
  install -Dm755 bin/corral-github "${pkgdir}/usr/bin/corral-github"
}
