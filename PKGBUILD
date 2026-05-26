# Maintainer: Joao Costa <arch@joaocosta.dev>
pkgname=tasks-org-bin
_pkgname=tasks-org
pkgver=15.6.0
pkgrel=1
pkgdesc="Bringing Astrid Tasks back from the dead"
arch=('x86_64')
url="https://github.com/tasks/tasks"
license=('GPL-3.0-only')
depends=('hicolor-icon-theme' 'libx11' 'libxext' 'libxrender' 'libxtst' 'freetype2' 'alsa-lib' 'libxi' 'fontconfig' 'libglvnd' 'wayland' 'zlib' 'gcc-libs')
options=('!debug')
provides=('tasks-org')
conflicts=('tasks-org')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/tasks/tasks/releases/download/15.6/tasks-org-15.6.0-linux-amd64.tar.gz")
sha256sums=('c2b2b38003a0b10c6c23578dc3ab1938d97566af3f23adeeb8b95f11e63f896c')

package() {
  install -dm755 "$pkgdir/usr/lib/tasksorg-llc/tasks-org"
  cp -a "${srcdir}/${_pkgname}-${pkgver}/." "$pkgdir/usr/lib/tasksorg-llc/tasks-org/"

  install -dm755 "$pkgdir/usr/bin"
  ln -sf /usr/lib/tasksorg-llc/tasks-org/bin/tasks-org "$pkgdir/usr/bin/tasks-org"

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/share/applications/org.tasks.desktop" "$pkgdir/usr/share/applications/org.tasks.desktop"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/share/icons/hicolor/512x512/apps/tasksorg-llc-tasks-org.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/tasksorg-llc-tasks-org.png"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/share/metainfo/org.tasks.metainfo.xml" "$pkgdir/usr/share/metainfo/org.tasks.metainfo.xml"
}
