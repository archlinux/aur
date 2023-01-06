# Maintainer: Mahamudul Hasan <919.hasan@gmail.com>
pkgname=gnome-shell-extension-maximize-to-empty-workspace-git
_uuid="MaximizeToEmptyWorkspace-extension@kaisersite.de"
pkgver=r21.a9c046d
pkgrel=1
pkgdesc='New and maximized windows will be moved to empty workspaces. Supports multiple monitors.'
arch=('any')
url="https://github.com/kaiseracm/gnome-shell-extension-maximize-to-empty-workspace"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
optdepends=()
conflicts=('gnome-shell-extension-maximize-to-empty-workspace')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}/${_uuid}"
  install -Dm644 -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}" *.js metadata.json
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../LICENSE
}
