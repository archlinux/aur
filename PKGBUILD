# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vulkan-caps-viewer
pkgver=1.5
pkgrel=1
pkgdesc='Vulkan Hardware Capability Viewer'
url='http://vulkan.gpuinfo.org/'
arch=('x86_64')
license=('GPL2')
source=('vulkan-caps-viewer.desktop'
        'android_icon_256.png')
sha1sums=('7ccdb4b4487b43bb428c32994092c00ca14f594a'
          '96c802c82c45626f3b6bdbb846d0f1f7e67ab28e')
source_x86_64=("http://vulkan.gpuinfo.org/downloads/vulkancapsviewer_${pkgver//./_}_linux64.tar.gz")
sha1sums_x86_64=('22fc0259470d987430c1e0158322568a7ba42e52')
depends=('vulkan-icd-loader' 'qt5-base' 'qt5-x11extras')

package() {
  cd "${srcdir}"

  # App
  install -dm755 "${pkgdir}"/usr/bin
  install -m755 vulkanCapsViewer "${pkgdir}"/usr/bin

  # Desktop shortcut
  install -Dm644 vulkan-caps-viewer.desktop "${pkgdir}"/usr/share/applications/vulkan-caps-viewer.desktop
  install -Dm644 android_icon_256.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png
}
