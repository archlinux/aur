# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vulkan-caps-viewer-wayland-bin
pkgver=3.01
pkgrel=1
pkgdesc='Vulkan Hardware Capability Viewer (prebuilt, for use on Wayland)'
url='http://vulkan.gpuinfo.org/'
arch=('x86_64')
license=('GPL2')
source=('vulkan-caps-viewer.desktop'
        'android_icon_256.png')
sha1sums=('7ccdb4b4487b43bb428c32994092c00ca14f594a'
          '96c802c82c45626f3b6bdbb846d0f1f7e67ab28e')
sha1sums_x86_64=('eaf4da42454ece66ace44923d4fdfc459c809380')
source_x86_64=("https://vulkan.gpuinfo.org/downloads/vulkancapsviewer_${pkgver}_linux64_wayland.AppImage")
depends=('vulkan-icd-loader' 'qt5-base' 'qt5-wayland')
conflicts=(vulkan-caps-viewer vulkan-caps-viewer-bin)
provides=(vulkan-caps-viewer)
options=('!strip')

package() {
  # App
  install -dm755 "$pkgdir"/usr/bin
  install -m755 *.AppImage "$pkgdir"/usr/bin/vulkanCapsViewer

  # Desktop shortcut
  install -Dm644 vulkan-caps-viewer.desktop "$pkgdir"/usr/share/applications/vulkan-caps-viewer.desktop
  install -Dm644 android_icon_256.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png
}
