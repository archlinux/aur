# Maintainer: xifan <xifan2333@gmail.com>
pkgname=herdr-corral-bin
_pkgname=herdr-corral
pkgver=0.1.6
pkgrel=1
pkgdesc="VS Code-style terminal workbench plugin for Herdr (Explorer / SCM / GitHub)"
arch=('x86_64' 'aarch64')
url="https://github.com/xifan2333/herdr-corral"
license=('MIT')
depends=('glib2')
optdepends=(
  'herdr: launch as a left-docked sidebar plugin'
  'github-cli: GitHub sidebar and detail client'
  'nvim: owner-scoped editor / preview pane'
  'imv: open GitHub attachment images from the detail client'
)
provides=('corral' 'herdr-corral')
conflicts=('corral' 'herdr-corral' 'herdr-corral-git')
options=(!strip)
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.xz::https://github.com/xifan2333/herdr-corral/releases/download/v0.1.6/herdr-corral-0.1.6-x86_64.tar.xz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.xz::https://github.com/xifan2333/herdr-corral/releases/download/v0.1.6/herdr-corral-0.1.6-aarch64.tar.xz")
sha256sums_x86_64=('14702ff73720b6d7134dd3c2a44e7ef99c0df7285467ff385fda30daeeaab5f5')
sha256sums_aarch64=('SKIP')

package() {
  local tree="${srcdir}/${_pkgname}-${pkgver}-${CARCH}"
  cd "${tree}"

  install -Dm755 bin/corral        "${pkgdir}/usr/bin/corral"
  install -Dm755 bin/corral-diff   "${pkgdir}/usr/bin/corral-diff"
  install -Dm755 bin/corral-github "${pkgdir}/usr/bin/corral-github"
}
