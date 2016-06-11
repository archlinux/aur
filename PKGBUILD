# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vulkan-caps-viewer
pkgver=1.1
pkgrel=2
pkgdesc='Vulkan Hardware Capability Viewer'
url='http://vulkan.gpuinfo.org/'
arch=('x86_64')
license=('GPL2')
source=('vulkan-caps-viewer.desktop')
sha1sums=('7ccdb4b4487b43bb428c32994092c00ca14f594a')
source_x86_64=("http://vulkan.gpuinfo.org/downloads/vulkancapsviewer_${pkgver//./_}_linux64.tar.gz")
sha1sums_x86_64=('971bb05dcce1229d43112955243d9358a78ae1b3')
depends=('vulkan-icd-loader' 'qt5-base')

package() {
  cd "${srcdir}"/vulkancapsviewer_${pkgver//./_}_linux64

  # App
  install -dm755 "${pkgdir}"/usr/bin
  install -m755 vulkanCapsViewer "${pkgdir}"/usr/bin

  # Desktop shortcut
  install -Dm644 vulkan-caps-viewer.desktop "$pkgdir/usr/share/applications/vulkan-caps-viewer.desktop"
  install -Dm644 gfx/android_icon_256.png "$pkgdir/usr/share/icons/vulkan-caps-viewer.png"
}
