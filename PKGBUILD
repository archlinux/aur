# Maintainer: Marcel W. Wysocki <maci.stgn@gmail.com>
pkgname=tmog-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Task Manager TMOG, a native system monitor and task manager (precompiled binary)"
arch=('x86_64')
url="https://tmog.org"
license=('LicenseRef-proprietary')
depends=(
  'gcc-libs'
  'qt6-base'
  'qt6-svg'
  'systemd-libs'
)
provides=('tmog-task-manager')
conflicts=('tmog-task-manager')
source=("https://tmog.org/rtm/downloads/TaskManagerOG-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('a147c613d4a6f5c0ec16eaf52965593de523f9f0231e09c241460cc63352f325')
options=('!strip')

package() {
  cd "TaskManagerOG-${pkgver}-linux-x86_64"

  install -Dm755 bin/tmog-task-manager "${pkgdir}/usr/bin/tmog-task-manager"

  install -Dm644 share/applications/com.tmog.taskmanager.desktop \
    "${pkgdir}/usr/share/applications/com.tmog.taskmanager.desktop"
  install -Dm644 share/metainfo/com.tmog.taskmanager.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/com.tmog.taskmanager.metainfo.xml"

  for _size in 32x32 48x48 64x64 128x128 256x256 512x512; do
    install -Dm644 "share/icons/hicolor/${_size}/apps/tmog-task-manager.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/tmog-task-manager.png"
  done

  install -Dm644 share/pixmaps/tmog-task-manager.png \
    "${pkgdir}/usr/share/pixmaps/tmog-task-manager.png"

  install -Dm644 share/doc/tmog/LICENSE.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 share/doc/tmog/THIRD_PARTY_NOTICES.md \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
  install -Dm644 share/doc/tmog/Fluent-System-Icons-LICENSE.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/Fluent-System-Icons-LICENSE.txt"
  install -Dm644 share/doc/tmog/Michroma-OFL.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/Michroma-OFL.txt"
  install -Dm644 share/doc/tmog/Selawik-OFL.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/Selawik-OFL.txt"
  install -Dm644 share/doc/tmog/libwebm-LICENSE.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/libwebm-LICENSE.txt"
  install -Dm644 share/doc/tmog/libwebm-PATENTS.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/libwebm-PATENTS.txt"

  install -Dm644 share/doc/taskmanagerog/copyright \
    "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
