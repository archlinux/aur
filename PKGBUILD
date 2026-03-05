# Maintainer: ravencrowonyt <ravencrowonyt@icloud.com>

pkgname=spectacle-trayicon-git
pkgver=1.0.0.r0.g0000000
pkgrel=1
pkgdesc="KDE Plasma StatusNotifierItem tray icon for Spectacle (git version)"
arch=('any')
url="https://github.com/ravencrowonyt/spectacle-sni"
license=('MIT')
depends=(
  'python'
  'python-pydbus'
  'python-gobject'
  'libdbusmenu-glib'
  'gobject-introspection'
  'spectacle'
)
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/spectacle-sni"
  # r<revcount>.g<short-hash>
  printf "1.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/spectacle-sni"

  install -Dm755 spectacle-sni.py "${pkgdir}/usr/bin/spectacle-sni"
  install -Dm644 packaging/spectacle-sni.desktop "${pkgdir}/usr/share/applications/spectacle-sni.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
